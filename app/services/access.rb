class Access
  def self.is_admin_password(pw)
    pw == ENV["STINKCODE"]
  end
  
  def self.admin?(session)
    session[:stinker] == ENV["STINKNAME"]
  end
  
  def self.become_admin!(session)
    session[:stinker] = ENV["STINKNAME"]
  end
  
  def self.unbecome_admin!(session)
    session[:stinker] = nil
  end
end
