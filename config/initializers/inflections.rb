ActiveSupport::Inflector.inflections(:en) do |inflect|
  
  # Examples
  # inflect.plural /^(ox)$/i, '\1en'
  # inflect.singular /^(ox)en/i, '\1'
  # inflect.irregular 'person', 'people'
  # inflect.uncountable %w( fish sheep )
  
  inflect.plural /^(genus)$/i, '\1es'
  inflect.singular /^(genus)es/i, '\1'
  inflect.uncountable %w( species )
end
