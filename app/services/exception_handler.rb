class ExceptionHandler
  def self.notify_exception(exception, options)
    if Rails.env.production?
      ExceptionNotifier.notify_exception(exception, options)
    else
      Rails.logger.debug "ExceptionHandler: " + exception.inspect
    end
  end
end
