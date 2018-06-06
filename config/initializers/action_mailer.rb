# Send email with postmark
Rails.application.config.action_mailer.delivery_method = :postmark
Rails.application.config.action_mailer.postmark_settings = { :api_key => ENV.fetch("POSTMARK_API_KEY") }
