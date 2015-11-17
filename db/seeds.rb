# RINGS ###########################################################################################
rings = Kingdom.create! name: "Ring"

# Gold Ring ######################################
gold_ring = rings.products.create! name: "Gold Ring", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15

gold_ring.infos.create! name: "Tips", content: "Gold Ring Tips Content"
gold_ring.infos.create! name: "Sizing", content: "Gold Ring Sizing Content"
gold_ring.infos.create! name: "Gifting", content: "Gold Ring Gifting Content"
gold_ring.infos.create! name: "Uniqueness", content: "Gold Ring Uniqueness Content"

gold_ring_leather_color = gold_ring.variations.create! name: "Leather Color", level: 0, has_image: true
gold_ring_leather_color.variants.create! name: "Gold Stripes", show_retail: true, show_wholesale: true, description: "Black like the night."
gold_ring_leather_color.variants.create! name: "Gold Spots", show_retail: true, show_wholesale: true, description: "Black like the night."
gold_ring_leather_color.variants.create! name: "Silver Spots", show_retail: true, show_wholesale: true, description: "Black like the night."
gold_ring_leather_color.variants.create! name: "Flat Black", show_retail: true, show_wholesale: true, description: "Black like the night."

gold_ring_size = gold_ring.variations.create! name: "Size", level: 1
gold_ring_size.variants.create! name: "Tiny", show_retail: true, show_wholesale: true
gold_ring_size.variants.create! name: "Small", show_retail: true, show_wholesale: true
gold_ring_size.variants.create! name: "Medium", show_retail: true, show_wholesale: true
gold_ring_size.variants.create! name: "Large", show_retail: true, show_wholesale: true


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
wrap_cuff_color.variants.create! name: "Natural5", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."
wrap_cuff_color.variants.create! name: "Natural6", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."
wrap_cuff_color.variants.create! name: "Natural7", show_retail: true, show_wholesale: true, description: "The one, the only, the classic, the champion. This is our product. You'll love it forever, but you'll also buy them by the fistful."

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


## LOCATIONS ######################################################################################

Location.create!(
      name: "Make at Granville Island",
      url: "makevancouver.com",
      address: "1648 Duranleau Street",
      city: "Vancouver",
      province: "British Columbia",
      postal: "V6H 3S4",
      country: "Canada"
      )
Location.create!(
      name: "Two Rivers Gallery",
      url: "www.tworiversgallery.ca",
      address: "725 Civic Plaza",
      city: "Prince George",
      province: "British Columbia",
      postal: "V2L 5T1",
      country: "Canada"
      )
Location.create!(
      name: "The Butcher's Daughter",
      url: "www.facebook.com/TheButchersDaughterGiftShoppe",
      address: "Saint John City Market\n47 Charlotte Street",
      city: "Saint John",
      province: "New Brunswick",
      postal: "E2L 2H8",
      country: "Canada"
      )
Location.create!(
      name: "Favourite",
      url: "favouritegifts.ca",
      address: "123 Carrie Cates Court",
      city: "North Vancouver",
      province: "British Columbia",
      postal: "V7M 3K7",
      country: "Canada"
      )
Location.create!(
      name: "Black Star",
      url: "www.blackstarstudios.ca",
      address: "1021 7th Avenue",
      city: "Invermere",
      province: "British Columbia",
      postal: "V0A-1K0",
      country: "Canada"
      )
Location.create!(
      name: "Siding 14",
      url: "www.facebook.com/Siding14Gallery",
      address: "5214 50 Street",
      city: "Ponoka",
      province: "Alberta",
      postal: "T4J 1S1",
      country: "Canada"
      )
Location.create!(
      name: "Whyte Museum",
      url: "www.whyte.org",
      address: "111 Bear St",
      city: "Banff",
      province: "Alberta",
      postal: "T1L 1A3",
      country: "Canada"
      )
Location.create!(
      name: "Made You Look",
      url: "www.madeyoulook.ca",
      address: "1338 Queen Street West",
      city: "Toronto",
      province: "Ontario",
      postal: "M6K 1L4",
      country: "Canada"
      )
Location.create!(
      name: "Oxtongue Craft Cabin & Gallery",
      url: "oxtonguecraftcabin.com",
      address: "1073 Fox Point Road",
      city: "Dwight",
      province: "Ontario",
      postal: "P0A 1H0",
      country: "Canada"
      )
Location.create!(
      name: "Cottage North",
      url: "www.cottagenorthsoapworks.com",
      address: "359 Main St.",
      city: "Port Dover",
      province: "Ontario",
      postal: "N0A 1N0",
      country: "Canada"
      )
Location.create!(
      name: "Timmins Museum Gift Shop",
      url: "www.timminsmuseum.ca/gifts-from-everywhere-for-everyone/",
      address: "325 Second Ave",
      city: "Timmins",
      province: "Ontario",
      postal: "P4N 0B3",
      country: "Canada"
      )
Location.create!(
      name: "Moose Lake Trading Post and Lodge",
      url: "www.mooselakecottages.com/tradep.html",
      address: "1870 Hwy 69",
      city: "Pointe au Baril",
      province: "Ontario",
      postal: "P0G 1K0",
      country: "Canada"
      )
Location.create!(
      name: "Hempware",
      url: "www.hempwareonline.com",
      address: "98 Duckworth st.",
      city: "St. Johns",
      province: "Newfoundland",
      postal: "A1C 1E8",
      country: "Canada"
      )
Location.create!(
      name: "Northern Sun Gallery",
      url: "www.northernsungallery.com",
      address: "8 Edgewater St.",
      city: "Mahone Bay",
      province: "Nova Scotia",
      postal: "B0J 2E0",
      country: "Canada"
      )
Location.create!(
      name: "Aphrodite",
      url: "aphroditeartandfashion.com",
      address: "292 Main Street",
      city: "Antigonish",
      province: "Nova Scotia",
      postal: "B2G 2C4",
      country: "Canada"
      )
Location.create!(
      name: "Moon Snail",
      url: "www.ilovemoonsnail.com",
      address: "85 Water Street",
      city: "Charlottetown",
      province: "Prince Edward Island",
      postal: "C1A 1A5",
      country: "Canada"
      )
Location.create!(
      name: "La Cour",
      address: "166 a. rue Saint-Amable",
      city: "Montreal",
      province: "Quebec",
      postal: "H2Y 1E8",
      country: "Canada"
      )
Location.create!(
      name: "MacKenzie Art Gallery",
      url: "www.mackenzieartgallery.sk.ca",
      address: "3475 Albert St",
      city: "Regina",
      province: "Saskatchewan",
      postal: "S4S 6X6",
      country: "Canada"
      )
