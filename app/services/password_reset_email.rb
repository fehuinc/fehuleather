class PasswordResetEmail
  def self.send(merchant, host)
    return false if merchant.password_reset_sent_at && merchant.password_reset_sent_at > 15.minutes.ago
    merchant.generate_password_reset
    mail = Mails.password_reset(merchant, host).deliver_now
  end
end
