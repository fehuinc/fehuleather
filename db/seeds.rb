# RINGS ###########################################################################################
rings = Kingdom.create! name: "Ring"

# Raw Ring ######################################
raw_ring = rings.products.create! name: "Raw Ring", description: "Raw Ring Description"

raw_ring.infos.create! name: "Tips", content: "Tips Content"
raw_ring.infos.create! name: "Sizing", content: "Sizing Content"
raw_ring.infos.create! name: "Gifting", content: "Gifting Content"
raw_ring.infos.create! name: "Uniqueness", content: "Uniqueness Content"

raw_ring_leather_color = raw_ring.variations.create! name: "Leather Color", level: 0, has_image: true
raw_ring_leather_color.variants.create! name: "Red"
raw_ring_leather_color.variants.create! name: "Yellow"

raw_ring_size = raw_ring.variations.create! name: "Size", level: 1
raw_ring_size.variants.create! name: "Tiny"
raw_ring_size.variants.create! name: "Small"
# raw_ring_size.variants.create! name: "Medium"
# raw_ring_size.variants.create! name: "Large"

# BRACELETS #######################################################################################
bracelets = Kingdom.create! name: "Bracelet"

# C&C Bracelet ##################################
cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet", description: "C&C Bracelet Description"

cc_bracelet.infos.create! name: "Tips", content: "Tips Content"
cc_bracelet.infos.create! name: "Sizing", content: "Sizing Content"
cc_bracelet.infos.create! name: "Gifting", content: "Gifting Content"
cc_bracelet.infos.create! name: "Uniqueness", content: "Uniqueness Content"

cc_bracelet_gem = cc_bracelet.variations.create! name: "Gem", level: 0, has_image: true
cc_bracelet_gem.variants.create! name: "Howlite"
cc_bracelet_gem.variants.create! name: "Pyrite"
cc_bracelet_gem.variants.create! name: "Green Turquoise"
cc_bracelet_gem.variants.create! name: "Light Turquoise"
cc_bracelet_gem.variants.create! name: "Malachite"
cc_bracelet_gem.variants.create! name: "Lapis"
cc_bracelet_gem.variants.create! name: "Jasper"
cc_bracelet_gem.variants.create! name: "Smokey Quartz"
cc_bracelet_gem.variants.create! name: "Goldstone"

cc_bracelet_leather_color = cc_bracelet.variations.create! name: "Leather Color", level: 1, has_image: true
cc_bracelet_leather_color.variants.create! name: "Red"
cc_bracelet_leather_color.variants.create! name: "Yellow"

cc_bracelet_size = cc_bracelet.variations.create! name: "Size", level: 2, has_image: false
cc_bracelet_size.variants.create! name: "Small"
cc_bracelet_size.variants.create! name: "Normal"

# Wrap Cuff #####################################
wrap_cuff = bracelets.products.create! name: "Wrap Cuff", description: "Wrap Cuff Description"

wrap_cuff.infos.create! name: "Tips", content: "Tips Content"
wrap_cuff.infos.create! name: "Sizing", content: "Sizing Content"
wrap_cuff.infos.create! name: "Gifting", content: "Gifting Content"
wrap_cuff.infos.create! name: "Uniqueness", content: "Uniqueness Content"

wrap_cuff_color = wrap_cuff.variations.create! name: "Color", level: 0, has_image: true
wrap_cuff_color.variants.create! name: "Bark"
wrap_cuff_color.variants.create! name: "Green"
wrap_cuff_color.variants.create! name: "Pink"
wrap_cuff_color.variants.create! name: "Pumpkin"
wrap_cuff_color.variants.create! name: "Slate"
wrap_cuff_color.variants.create! name: "Turq"
wrap_cuff_color.variants.create! name: "Orangesicle"
wrap_cuff_color.variants.create! name: "Violet"

wrap_cuff_size = wrap_cuff.variations.create! name: "Size", level: 1, has_image: false
wrap_cuff_size.variants.create! name: "Small"
wrap_cuff_size.variants.create! name: "Normal"

# Fuzzy Cuff ####################################
fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff", description: "Fuzzy Cuff Description"

fuzzy_cuff.infos.create! name: "Tips", content: "Tips Content"
fuzzy_cuff.infos.create! name: "Sizing", content: "Sizing Content"
fuzzy_cuff.infos.create! name: "Gifting", content: "Gifting Content"
fuzzy_cuff.infos.create! name: "Uniqueness", content: "Uniqueness Content"

fuzzy_cuff_name = fuzzy_cuff.variations.create! name: "Name", level: 0, has_image: true
fuzzy_cuff_name.variants.create! name: "Painter"
fuzzy_cuff_name.variants.create! name: "Mo"
fuzzy_cuff_name.variants.create! name: "Spook"
fuzzy_cuff_name.variants.create! name: "Duster"
fuzzy_cuff_name.variants.create! name: "Grumble"
fuzzy_cuff_name.variants.create! name: "Tippy"
fuzzy_cuff_name.variants.create! name: "Wizen"
fuzzy_cuff_name.variants.create! name: "Chief"
fuzzy_cuff_name.variants.create! name: "Fluffle"
fuzzy_cuff_name.variants.create! name: "Wiley"
fuzzy_cuff_name.variants.create! name: "Bean"
fuzzy_cuff_name.variants.create! name: "Hunt"
