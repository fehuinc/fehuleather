class Access
  def self.is_admin_password(pw)
    pw == ENV.fetch("STINKCODE")
  end
  
  def self.admin?(session)
    session[:stinker] == ENV.fetch("STINKNAME")
  end
  
  def self.become_admin!(session)
    session[:stinker] = ENV.fetch("STINKNAME")
  end
  
  def self.unbecome_admin!(session)
    session[:stinker] = nil
  end
end
