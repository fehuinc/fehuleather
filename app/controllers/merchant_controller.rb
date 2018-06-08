class MerchantController < ApplicationController
  include MerchantAuth

  def login
    # The only way we arrive at this action is if session[:merchant_id] is nil
    # Otherwise, we'd have hit the 'main' action

    # We'll pre-populate the form with the merchant email (if they were previously logged in)
    @merchant = Merchant.new(email: session[:merchant_email])
  end


  def login_post
    if existing_merchant = Merchant.find_by_email_insensitive(merchant_params[:email])
      session[:merchant_email] = existing_merchant.email
      redirect_to merchant_check_password_path

    else
      @merchant = Merchant.new(email: merchant_params[:email])
      @merchant.valid?

      # Email was invalid
      if @merchant.errors[:email].any?
        @merchant.errors.clear # Ignore errors on other fields
        @merchant.errors.add(:email, "is invalid")
        render :login

      # Need to create a new merchant
      else
        session[:merchant_email] = merchant_params[:email]
        redirect_to merchant_create_password_path

      end
    end
  end


  def create_password
    @merchant = Merchant.new(email: session[:merchant_email])
  end


  def create_password_post
    @merchant = Merchant.new(
      email: session[:merchant_email],
      password: merchant_params[:password],
      password_confirmation: merchant_params[:password_confirmation]
    )
    @merchant.valid?

    # Password was invalid
    if @merchant.errors[:password].any? || @merchant.errors[:password_confirmation].any?
      pw = @merchant.errors[:password]
      pwc = @merchant.errors[:password_confirmation]
      @merchant.errors.clear # Ignore errors on other fields
      pw.each { |e| @merchant.errors.add(:password, e) }
      pwc.each { |e| @merchant.errors.add(:password_confirmation, e) }
      render :create_password

    else
      session[:merchant_password] = merchant_params[:password]
      redirect_to merchant_details_path

    end
  end


  def details
    @merchant = Merchant.new(email: session[:merchant_email], password: session[:merchant_password], password_confirmation: session[:merchant_password])
  end


  def details_post
    @merchant = Merchant.new(merchant_params)
    @merchant.assign_attributes email: session[:merchant_email], password: session[:merchant_password], password_confirmation: session[:merchant_password]

    if @merchant.valid?
      @merchant.save
      session.delete(:merchant_password)
      set_authenticated_merchant @merchant
      redirect_to merchant_path

    else
      render :details
    end
  end


  def check_password
    @merchant = Merchant.find_by_email_insensitive(session[:merchant_email])
  end


  def check_password_post
    @merchant = Merchant.find_by_email_insensitive(session[:merchant_email])

    if authenticate(session[:merchant_email], merchant_params[:password])
      redirect_to merchant_path
    else
      @merchant.errors.add(:password, "was incorrect")
      render :check_password
    end
  end


  def send_password_reset
    @merchant = Merchant.find_by_email_insensitive(session[:merchant_email].strip)

    if @merchant.nil?
      redirect_to merchant_path

    elsif PasswordResetEmail.send(@merchant, request.base_url)
      redirect_to :root, success: "Password Reset instructions have been sent to your email."

    else
      @merchant.errors.add(:base, "Please wait 15 minutes before trying to reset your password again")
      render :check_password
    end
  end


  def reset_password
    deauthenticate if logged_in?
    @token = params[:token]
    @merchant = Merchant.load_from_reset_password_token(@token)
    if @merchant.blank?
      redirect_to merchant_path, notice: "That password reset is no longer valid."
    end
  end


  def reset_password_patch
    deauthenticate if logged_in?
    @token = params[:token]
    @merchant = Merchant.load_from_reset_password_token(@token)
    password = merchant_params[:password]
    confirmation = merchant_params[:password_confirmation]

    # Note: We need to manually validate here, since password validations are currently only executed on create
    # Note (2018-01): The above might not be true anymore
    if @merchant.nil?
      redirect_to merchant_path, notice: "That password reset is no longer valid"

    elsif password.blank?
      @merchant.errors.add(:password, "cannot be blank")
      render :reset_password

    elsif password != confirmation
      @merchant.errors.add(:password, "must be entered correctly both times")
      render :reset_password

    elsif password.length < 8
      @merchant.errors.add(:password, "is too short (minimum is 8 characters)")
      render :reset_password

    # This also clears the temporary token
    elsif @merchant.consume_password_reset(password)
      set_authenticated_merchant(@merchant)
      redirect_to merchant_path, success: 'Saved'

    else
      render :reset_password
    end
  end


  # LOGGED IN #####################################################################################
  # session[:merchant_email] is set
  # session[:merchant_id] is set


  def update
    @merchant = Merchant.find(session[:merchant_id])

    if @merchant.update merchant_params
      session[:merchant_email] = @merchant.email
      flash[:notice] = "Saved"
      redirect_to merchant_path

    else
      render :index

    end
  end


  def index
    @merchant = Merchant.find_by_id(session[:merchant_id])
    redirect_to logout_merchant_path if @merchant.nil?
  end


  def logout
    deauthenticate
    redirect_to root_path
  end


private

  def merchant_params
    params.require(:merchant).permit(:id, :email, :password, :password_confirmation, :phone_number, :store_name, :tax_id_number, :your_name)
  end

end
