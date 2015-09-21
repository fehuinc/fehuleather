# RINGS ###########################################################################################
rings = Kingdom.create! name: "Ring"

# Raw Ring ######################################
raw_ring = rings.products.create! name: "Raw Ring", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15

raw_ring.infos.create! name: "Tips", content: "Raw Ring Tips Content"
raw_ring.infos.create! name: "Sizing", content: "Raw Ring Sizing Content"
raw_ring.infos.create! name: "Gifting", content: "Raw Ring Gifting Content"
raw_ring.infos.create! name: "Uniqueness", content: "Raw Ring Uniqueness Content"

raw_ring_leather_color = raw_ring.variations.create! name: "Leather Color", level: 0, has_image: true
raw_ring_leather_color.variants.create! name: "Red", show_retail: true, show_wholesale: true, description: "A fetching slice of saddle leather that starts off richly red and ages to a wealthy coffee brown."
raw_ring_leather_color.variants.create! name: "Yellow", show_retail: true, show_wholesale: true, description: "Saddle leather turned to a sweet, honeyed yellow by a bath in natural extracts. Darkens with wear and sunlight to a deep golden brown."

raw_ring_size = raw_ring.variations.create! name: "Size", level: 1
raw_ring_size.variants.create! name: "Tiny", show_retail: true, show_wholesale: true
raw_ring_size.variants.create! name: "Small", show_retail: true, show_wholesale: true
raw_ring_size.variants.create! name: "Medium", show_retail: true, show_wholesale: true
raw_ring_size.variants.create! name: "Large", show_retail: true, show_wholesale: true

# BRACELETS #######################################################################################
bracelets = Kingdom.create! name: "Bracelet"

# C&C Bracelet ##################################
cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 10

cc_bracelet.infos.create! name: "Tips", content: "C&C Tips Content"
cc_bracelet.infos.create! name: "Sizing", content: "C&C Sizing Content"
cc_bracelet.infos.create! name: "Gifting", content: "C&C Gifting Content"
cc_bracelet.infos.create! name: "Uniqueness", content: "C&C Uniqueness Content"

cc_bracelet_gem = cc_bracelet.variations.create! name: "Gem", level: 0, has_image: true
cc_bracelet_gem.variants.create! name: "Howlite", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Howlite indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Pyrite", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Pyrite indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Green Turquoise", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Green indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Light Turquoise", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Light indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Malachite", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Malachite indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Lapis", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Lapis indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Jasper", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Jasper indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Smokey Quartz", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Smokey indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."
cc_bracelet_gem.variants.create! name: "Goldstone", show_retail: true, show_wholesale: true, description: "A descriptive bit of captioning goes here, and it is Goldstone indeed. Perhaps another sentence will give us some breadth and depth of understanding. Perhaps not."

cc_bracelet_leather_color = cc_bracelet.variations.create! name: "Leather Color", level: 1, has_image: true
cc_bracelet_leather_color.variants.create! name: "Red", show_retail: true, show_wholesale: true
cc_bracelet_leather_color.variants.create! name: "Yellow", show_retail: true, show_wholesale: true

cc_bracelet_size = cc_bracelet.variations.create! name: "Size", level: 2, has_image: false
cc_bracelet_size.variants.create! name: "Small", show_retail: true, show_wholesale: true
cc_bracelet_size.variants.create! name: "Normal", show_retail: true, show_wholesale: true

# Wrap Cuff #####################################
wrap_cuff = bracelets.products.create! name: "Wrap Cuff", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 20

wrap_cuff.infos.create! name: "Tips", content: "Wrap Cuff Tips Content"
wrap_cuff.infos.create! name: "Sizing", content: "Wrap Cuff Sizing Content"
wrap_cuff.infos.create! name: "Gifting", content: "Wrap Cuff Gifting Content"
wrap_cuff.infos.create! name: "Uniqueness", content: "Wrap Cuff Uniqueness Content"

wrap_cuff_color = wrap_cuff.variations.create! name: "Color", level: 0, has_image: true
wrap_cuff_color.variants.create! name: "Natural1", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."
wrap_cuff_color.variants.create! name: "Natural2", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."
wrap_cuff_color.variants.create! name: "Natural3", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."
wrap_cuff_color.variants.create! name: "Natural4", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."

wrap_cuff_size = wrap_cuff.variations.create! name: "Size", level: 1, has_image: false
wrap_cuff_size.variants.create! name: "Small", show_retail: true, show_wholesale: true
wrap_cuff_size.variants.create! name: "Normal", show_retail: true, show_wholesale: true

# Fuzzy Cuff ####################################
fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 25

fuzzy_cuff.infos.create! name: "Tips", content: "Fuzzy Cuff Tips Content"
fuzzy_cuff.infos.create! name: "Sizing", content: "Fuzzy Cuff Sizing Content"
fuzzy_cuff.infos.create! name: "Gifting", content: "Fuzzy Cuff Gifting Content"
fuzzy_cuff.infos.create! name: "Uniqueness", content: "Fuzzy Cuff Uniqueness Content"

fuzzy_cuff_name = fuzzy_cuff.variations.create! name: "Name", level: 0, has_image: true
fuzzy_cuff_name.variants.create! name: "Painter", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Mo", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Spook", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Duster", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Grumble", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Tippy", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Wizen", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Chief", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Fluffle", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Wiley", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Bean", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
fuzzy_cuff_name.variants.create! name: "Hunt", show_retail: true, show_wholesale: true, description: "These cuffs are cute and fuzzy and fluffy and snuggable and totally just lovely wonderful you want them you want them please!"
