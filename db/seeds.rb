rings = Kingdom.create! name: "Ring"

wrap_ring = rings.products.create! name: "Wrap Ring"
wrap_ring_black = wrap_ring.variations.create! name: "Black", totem_image: ENV["IMAGEPATH"] + "wrap-ring/totem/front.jpg"

row = TotemRow.create! index: 0
row.items.create! name: "Wrap Ring", variation: wrap_ring_black

hair = Kingdom.create! name: "Hair"

hair_cuff = hair.products.create! name: "Hair Cuff"
hair_cuff.variations.create! name: "Front"
hair_cuff.variations.create! name: "Back"

bracelets = Kingdom.create! name: "Bracelets"

wrap_cuff = bracelets.products.create! name: "Wrap Cuff"
wrap_cuff.variations.create! name: "Back"
wrap_cuff.variations.create! name: "Natural1"
wrap_cuff.variations.create! name: "Natural2"
wrap_cuff.variations.create! name: "Natural3"
wrap_cuff.variations.create! name: "Natural4"
wrap_cuff.variations.create! name: "Natural5"
wrap_cuff.variations.create! name: "Natural6"
wrap_cuff.variations.create! name: "Natural7"

row = TotemRow.create! index: 2
row.items.create! name: "Wrap Cuff", content: "We'll soon be offering this product for sale, right here. Check back in February!", image: ENV["IMAGEPATH"] + "wrap-cuff/totem/back.jpg"

gilt_cuff = bracelets.products.create! name: "Gilt Cuff"
gilt_cuff.variations.create! name: "Back"
gilt_cuff.variations.create! name: "Front"

fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff"
fuzzy_cuff.variations.create! name: "Painter"
fuzzy_cuff.variations.create! name: "Mo"
fuzzy_cuff.variations.create! name: "Spook"
fuzzy_cuff.variations.create! name: "Duster"
fuzzy_cuff.variations.create! name: "Grumble"
fuzzy_cuff.variations.create! name: "Tippy"
fuzzy_cuff.variations.create! name: "Wizen"
fuzzy_cuff.variations.create! name: "Chief"
fuzzy_cuff.variations.create! name: "Fluffle"
fuzzy_cuff.variations.create! name: "Wiley"
fuzzy_cuff.variations.create! name: "Bean"
fuzzy_cuff.variations.create! name: "Hunt"

cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet"
cc_bracelet.variations.create! name: "Front"
cc_bracelet.variations.create! name: "Howlite"
cc_bracelet.variations.create! name: "Pyrite"
cc_bracelet.variations.create! name: "Green Turquoise"
cc_bracelet.variations.create! name: "Light Turquoise"
cc_bracelet.variations.create! name: "Malachite"
cc_bracelet.variations.create! name: "Lapis"
cc_bracelet.variations.create! name: "Jasper"
cc_bracelet.variations.create! name: "Smokey Quartz"
cc_bracelet.variations.create! name: "Goldstone"

row = TotemRow.create! index: 3
row.items.create! name: "Coffee & Crystals Bracelet", content: "We'll soon be offering this product for sale, right here. Check back in February!", image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/front.jpg"

belts = Kingdom.create! name: "Belts"

cc_belt = belts.products.create! name: "Coffee & Crystals Belt"
cc_belt.variations.create! name: "Front"

volva_belt = belts.products.create! name: "Volva Belt"
volva_belt.variations.create! name: "Front"

row = TotemRow.create! index: 4
row.items.create! name: "Volva Belt", content: "We'll soon be offering this product for sale, right here. Check back in February!", image: ENV["IMAGEPATH"] + "volva-belt/totem/front.jpg"

seven_belt = belts.products.create! name: "7 Belt"
seven_belt.variations.create! name: "Back"
seven_belt.variations.create! name: "Front"

row = TotemRow.create! index: 5
row.items.create! name: "7 Belt", content: "We'll soon be offering this product for sale, right here. Check back in February!", image: ENV["IMAGEPATH"] + "7-belt/totem/back.jpg"

thirteen_belt = belts.products.create! name: "13 Belt"
thirteen_belt.variations.create! name: "Back"
thirteen_belt.variations.create! name: "Front"


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

Event.create! name: "By Hand", date: "Jan 31st - Feb 3rd, 2016", location: "Toronto, ON", description: "Booth #301"
