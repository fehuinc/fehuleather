rings = Kingdom.create! name: "Ring"

wrap_ring = rings.products.create! name: "Wrap Ring", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
wrap_ring_style = wrap_ring.variations.create! name: "Style", level: 0, has_image: true
wrap_ring_style.variants.create! name: "Front", show_retail: true, show_wholesale: true
wrap_ring_style.variants.create! name: "Back", show_retail: true, show_wholesale: true
wrap_ring_style.variants.create! name: "Black", show_retail: true, show_wholesale: true
wrap_ring_style.variants.create! name: "Gold Leaf", show_retail: true, show_wholesale: true
wrap_ring_style.variants.create! name: "White Leaf", show_retail: true, show_wholesale: true
wrap_ring_style.variants.create! name: "Gold Stripes", show_retail: true, show_wholesale: true


hair = Kingdom.create! name: "Hair"

hair_cuff = hair.products.create! name: "Hair Cuff", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
hair_cuff_style = hair_cuff.variations.create! name: "Style", level: 0, has_image: true
hair_cuff_style.variants.create! name: "Front", show_retail: true, show_wholesale: true
hair_cuff_style.variants.create! name: "Back", show_retail: true, show_wholesale: true


bracelets = Kingdom.create! name: "Bracelets"

wrap_cuff = bracelets.products.create! name: "Wrap Cuff", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
wrap_cuff_color = wrap_cuff.variations.create! name: "Color", level: 0, has_image: true
wrap_cuff_color.variants.create! name: "Back", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural1", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural2", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural3", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural4", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural5", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural6", show_retail: true, show_wholesale: false
wrap_cuff_color.variants.create! name: "Natural7", show_retail: true, show_wholesale: false

gilt_cuff = bracelets.products.create! name: "Gilt Cuff", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
gilt_cuff_style = gilt_cuff.variations.create! name: "Style", level: 0, has_image: true
gilt_cuff_style.variants.create! name: "Back", show_retail: true, show_wholesale: true
gilt_cuff_style.variants.create! name: "Front", show_retail: true, show_wholesale: true

fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff", show_retail: true, show_wholesale: false, price_retail: 100, price_wholesale: 50, ypos: 25
fuzzy_cuff_name = fuzzy_cuff.variations.create! name: "Name", level: 0, has_image: true
fuzzy_cuff_name.variants.create! name: "Painter", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Mo", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Spook", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Duster", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Grumble", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Tippy", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Wizen", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Chief", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Fluffle", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Wiley", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Bean", show_retail: true, show_wholesale: true
fuzzy_cuff_name.variants.create! name: "Hunt", show_retail: true, show_wholesale: true

cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
cc_bracelet_gem = cc_bracelet.variations.create! name: "Gem", level: 0, has_image: true
cc_bracelet_gem.variants.create! name: "Front", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Howlite", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Pyrite", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Green Turquoise", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Light Turquoise", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Malachite", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Lapis", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Jasper", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Smokey Quartz", show_retail: true, show_wholesale: true
cc_bracelet_gem.variants.create! name: "Goldstone", show_retail: true, show_wholesale: true

belts = Kingdom.create! name: "Belts"

cc_belt = belts.products.create! name: "Coffee & Crystals Belt", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
cc_belt_style = cc_belt.variations.create! name: "Style", level: 0, has_image: true
cc_belt_style.variants.create! name: "Front", show_retail: true, show_wholesale: true

volva_belt = belts.products.create! name: "Volva Belt", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
volva_belt_style = volva_belt.variations.create! name: "Style", level: 0, has_image: true
volva_belt_style.variants.create! name: "Front", show_retail: true, show_wholesale: true

seven_belt = belts.products.create! name: "7 Belt", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
seven_belt_style = seven_belt.variations.create! name: "Style", level: 0, has_image: true
seven_belt_style.variants.create! name: "Back", show_retail: true, show_wholesale: true
seven_belt_style.variants.create! name: "Front", show_retail: true, show_wholesale: true

thirteen_belt = belts.products.create! name: "13 Belt", show_retail: true, show_wholesale: true, price_retail: 100, price_wholesale: 50, ypos: 15
thirteen_belt_style = thirteen_belt.variations.create! name: "Style", level: 0, has_image: true
thirteen_belt_style.variants.create! name: "Back", show_retail: true, show_wholesale: true
thirteen_belt_style.variants.create! name: "Front", show_retail: true, show_wholesale: true


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

## EVENTS #########################################################################################

Event.create! name: "American Made Show", date: "January 15-17, 2016", location: "Washington DC", description: "Booth #1030"
Event.create! name: "By Hand", date: "Jan 31st - Feb 3rd, 2016", location: "Toronto, ON", description: "Booth #301"
