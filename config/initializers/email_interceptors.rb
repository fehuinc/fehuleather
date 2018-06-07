if Rails.env.development? || ENV.fetch("DOMAIN") == "https://fehu-staging.herokuapp.com"

  class DevEmailInterceptor
    def self.delivering_email(message)
      message.to = ["ivanreese@gmail.com"]
    end
  end
  ActionMailer::Base.register_interceptor(DevEmailInterceptor)

else

  class ExampleEmailInterceptor
    def self.delivering_email(message)
      if message.to.first.end_with?("@example.com")
        message.perform_deliveries = false
      end
    end
  end
  ActionMailer::Base.register_interceptor(ExampleEmailInterceptor)

end
