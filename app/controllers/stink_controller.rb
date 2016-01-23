class StinkController < ApplicationController
  def stink
    if Access.admin?(session)
      redirect_to :admin_root
    else
      render :stink
    end
  end
  
  def stink_in
    if Access.is_admin_password(params[:password])
      Access.become_admin!(session)
      redirect_to :admin_root
    else
      @stink_status = "You're not very stinky."
      render :stink
    end
  end
  
  def stink_out
    Access.unbecome_admin!(session)
    reset_session
    redirect_to :root
  end
end
