class Images
  def self.build_path(product_name, variantNames, type)
    return variantNames.join("-")
                       .prepend("#{type}/")
                       .prepend("#{product_name}/")
                       .downcase
                       .gsub('&', 'and')
                       .gsub(/[^0-9a-z\-\/]/, ' ')
                       .gsub(/\s+/, '-')
                       .concat(".jpg")
                       .prepend(ENV["IMAGEPATH"])
  end
end
