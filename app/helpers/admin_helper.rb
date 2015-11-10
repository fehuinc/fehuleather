module AdminHelper
  def admin?
    Access.admin?(session)
  end
end
