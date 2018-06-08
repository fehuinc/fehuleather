class Merchant < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy, class_name: "WholesaleOrder"
  belongs_to :current_order, class_name: "WholesaleOrder", optional: true
  has_many :addresses

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :password, # Confirmation is validated by has_secure_password
    allow_nil: true, # nils are caught by has_secure_password. Specifying allow_nil allows user.save to succeed when the password isn't changed.
    length: { minimum: 8, maximum: 72 }, # Max 72 is due to a limit in has_secure_password
    presence: true
  validates :phone_number, :store_name, :your_name, :tax_id_number, { presence: true }


  def self.find_by_email_insensitive(email)
    return unless email.present?
    e = email.downcase.strip
    Merchant.where('lower(email) = ?', e).first
  end


  # AUTH ##########################################################################################


  def self.authenticate(email, password)
    merchant = find_by_email_insensitive email
    return unless merchant
    return unless merchant.authenticate password
    return unless merchant.save
    merchant
  end


  def generate_password_reset(valid_for: 1.day)
    update(
      password_reset_token: TemporaryToken.generate_random_token,
      password_reset_sent_at: Time.now,
      password_reset_expires_at: Time.now + valid_for
    )
  end


  def consume_password_reset(new_password)
    update(
      password: new_password,
      password_reset_token: nil,
      password_reset_expires_at: nil
    )
  end

  def self.load_from_reset_password_token(token)
    return if token.blank?
    merchant = find_by_password_reset_token(token)
    return if merchant.nil?
    return if merchant.password_reset_token.nil?
    return if merchant.password_reset_expires_at.nil?
    return if merchant.password_reset_expires_at < Time.now
    merchant
  end


end
