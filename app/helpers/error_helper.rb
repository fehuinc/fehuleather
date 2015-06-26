module ErrorHelper
  def random_error_message
    concat [
      '"Houston, we have a problem!"',
      '"Errors, errors everywhere!"',
      '"Hold on a minute!"',
      '"That\'s an error!"',
      '"Mayday! Mayday!"',
      '"Whoa there!"',
      '"Err..."',
      '"Sorry!"'
      ].sample
  end
end
