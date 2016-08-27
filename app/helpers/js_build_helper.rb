module JsBuildHelper
  def js_build_elm(build, classes = "")
    json = build.to_json(
      only: [:id, :stock],
      methods: [:short_name, :retail_prices],
      include: {
        variation: {
          only: [:wholesale_image]
        }
      }
    )
    size = build.size.name
    return "<div class='#{classes}' js-build='#{json}'>#{size}</div>".html_safe
  end
end
