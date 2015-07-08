class StinkController < ApplicationController
  def stink
    if Access.admin?(session)
      redirect_to :admin_root
    else
      render :stink
    end
  end
  
  def stinkin
    if Access.is_admin_password(params[:password])
      Access.become_admin!(session)
      redirect_to :admin_root
    else
      redirect_to :stink
    end
  end
  
  def stinkout
    Access.unbecome_admin!(session)
    redirect_to :root
  end
end
