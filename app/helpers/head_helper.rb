module HeadHelper
  def head_title(title)
    if title.blank?
      "Fehu Inc."
    else
      title
    end
  end
  
  def head_description(desc)
    if desc.blank?
      "Unique leather cuffs and other cute stuffs."
    else
      desc
    end
  end
end
