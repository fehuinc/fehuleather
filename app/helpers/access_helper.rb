module AccessHelper
  def admin?
    Access.admin?(session)
  end
end
