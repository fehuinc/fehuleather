# RINGS ###########################################################################################
rings = Kingdom.create! name: "Ring"

# Raw Ring ######################################
raw_ring = rings.products.create! name: "Raw Ring", description: "Raw Ring Description", show_retail: true, show_wholesale: true, published: true, price_retail: 100, price_wholesale: 50

raw_ring.infos.create! name: "Tips", content: "Tips Content"
raw_ring.infos.create! name: "Sizing", content: "Sizing Content"
raw_ring.infos.create! name: "Gifting", content: "Gifting Content"
raw_ring.infos.create! name: "Uniqueness", content: "Uniqueness Content"

raw_ring_leather_color = raw_ring.variations.create! name: "Leather Color", level: 0, has_image: true
raw_ring_leather_color.variants.create! name: "Red", show_retail: true, show_wholesale: true, published: true
raw_ring_leather_color.variants.create! name: "Yellow", show_retail: true, show_wholesale: true, published: true

raw_ring_size = raw_ring.variations.create! name: "Size", level: 1
raw_ring_size.variants.create! name: "Tiny", show_retail: true, show_wholesale: true, published: true
raw_ring_size.variants.create! name: "Small", show_retail: true, show_wholesale: true, published: true
raw_ring_size.variants.create! name: "Medium", show_retail: true, show_wholesale: true, published: true
raw_ring_size.variants.create! name: "Large", show_retail: true, show_wholesale: true, published: true

# BRACELETS #######################################################################################
bracelets = Kingdom.create! name: "Bracelet"

# C&C Bracelet ##################################
cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet", description: "C&C Bracelet Description", show_retail: true, show_wholesale: true, published: true, price_retail: 100, price_wholesale: 50

cc_bracelet.infos.create! name: "Tips", content: "Tips Content"
cc_bracelet.infos.create! name: "Sizing", content: "Sizing Content"
cc_bracelet.infos.create! name: "Gifting", content: "Gifting Content"
cc_bracelet.infos.create! name: "Uniqueness", content: "Uniqueness Content"

cc_bracelet_gem = cc_bracelet.variations.create! name: "Gem", level: 0, has_image: true
cc_bracelet_gem.variants.create! name: "Howlite", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Pyrite", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Green Turquoise", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Light Turquoise", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Malachite", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Lapis", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Jasper", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Smokey Quartz", show_retail: true, show_wholesale: true, published: true
cc_bracelet_gem.variants.create! name: "Goldstone", show_retail: true, show_wholesale: true, published: true

cc_bracelet_leather_color = cc_bracelet.variations.create! name: "Leather Color", level: 1, has_image: true
cc_bracelet_leather_color.variants.create! name: "Red", show_retail: true, show_wholesale: true, published: true
cc_bracelet_leather_color.variants.create! name: "Yellow", show_retail: true, show_wholesale: true, published: true

cc_bracelet_size = cc_bracelet.variations.create! name: "Size", level: 2, has_image: false
cc_bracelet_size.variants.create! name: "Small", show_retail: true, show_wholesale: true, published: true
cc_bracelet_size.variants.create! name: "Normal", show_retail: true, show_wholesale: true, published: true

# Wrap Cuff #####################################
wrap_cuff = bracelets.products.create! name: "Wrap Cuff", description: "Wrap Cuff Description", show_retail: true, show_wholesale: true, published: true, price_retail: 100, price_wholesale: 50

wrap_cuff.infos.create! name: "Tips", content: "Tips Content"
wrap_cuff.infos.create! name: "Sizing", content: "Sizing Content"
wrap_cuff.infos.create! name: "Gifting", content: "Gifting Content"
wrap_cuff.infos.create! name: "Uniqueness", content: "Uniqueness Content"

wrap_cuff_color = wrap_cuff.variations.create! name: "Color", level: 0, has_image: true
wrap_cuff_color.variants.create! name: "Bark", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Green", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Pink", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Pumpkin", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Slate", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Turq", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Orangesicle", show_retail: true, show_wholesale: true, published: true
wrap_cuff_color.variants.create! name: "Violet", show_retail: true, show_wholesale: true, published: true

wrap_cuff_size = wrap_cuff.variations.create! name: "Size", level: 1, has_image: false
wrap_cuff_size.variants.create! name: "Small", show_retail: true, show_wholesale: true, published: true
wrap_cuff_size.variants.create! name: "Normal", show_retail: true, show_wholesale: true, published: true

# Fuzzy Cuff ####################################
fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff", description: "Fuzzy Cuff Description", show_retail: true, show_wholesale: true, published: true, price_retail: 100, price_wholesale: 50

fuzzy_cuff.infos.create! name: "Tips", content: "Tips Content"
fuzzy_cuff.infos.create! name: "Sizing", content: "Sizing Content"
fuzzy_cuff.infos.create! name: "Gifting", content: "Gifting Content"
fuzzy_cuff.infos.create! name: "Uniqueness", content: "Uniqueness Content"

fuzzy_cuff_name = fuzzy_cuff.variations.create! name: "Name", level: 0, has_image: true
fuzzy_cuff_name.variants.create! name: "Painter", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Mo", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Spook", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Duster", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Grumble", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Tippy", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Wizen", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Chief", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Fluffle", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Wiley", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Bean", show_retail: true, show_wholesale: true, published: true
fuzzy_cuff_name.variants.create! name: "Hunt", show_retail: true, show_wholesale: true, published: true
