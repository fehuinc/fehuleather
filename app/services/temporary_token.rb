require 'securerandom'

class TemporaryToken
  def self.generate_random_token(length = 15)
    SecureRandom.base64(length).tr('+/=lIO0', 'pqrsxyz')
  end
end
