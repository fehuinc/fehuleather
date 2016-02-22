belts =     Kingdom.create! name: "Belts"
bracelets = Kingdom.create! name: "Bracelets"
hair =      Kingdom.create! name: "Hair"
rings =     Kingdom.create! name: "Ring"


row = TotemRow.create! index: 0
wrap_cuff = bracelets.products.create! name: "Wrap Cuff"
wrap_cuff.sizes.create! name: "Adjustable"
row.items.create! variation: (wrap_cuff.variations.create! name: "Pumpkin",     totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/pumpkin.jpg")
# row.items.create! variation: (wrap_cuff.variations.create! name: "Black",       totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/black.jpg")
row.items.create! variation: (wrap_cuff.variations.create! name: "Nude",        totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/nude.jpg")
row.items.create! variation: (wrap_cuff.variations.create! name: "Slate",       totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/slate.jpg")
row.items.create! variation: (wrap_cuff.variations.create! name: "Cinnamon",    totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/cinnamon.jpg")
row.items.create! variation: (wrap_cuff.variations.create! name: "Walnut",      totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/walnut.jpg")
row.items.create! variation: (wrap_cuff.variations.create! name: "Turmeric",    totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/turmeric.jpg")
row.items.create! variation: (wrap_cuff.variations.create! name: "Mushroom",    totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/mushroom.jpg")
# row.items.create! variation: (wrap_cuff.variations.create! name: "Rose",        totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/rose.jpg")
# row.items.create! variation: (wrap_cuff.variations.create! name: "Cranberry",   totem_image: ENV["IMAGEPATH"] + "wrap-cuff/totem/cranberry.jpg")


row = TotemRow.create! index: 1
gilt_cuff = bracelets.products.create! name: "Gilt Cuff"
gilt_cuff.sizes.create! name: "Adjustable"
row.items.create! variation: (gilt_cuff.variations.create! name: "White/Black",    totem_image: ENV["IMAGEPATH"] + "gilt-cuff/totem/white-black.jpg")
row.items.create! variation: (gilt_cuff.variations.create! name: "White/Brown",    totem_image: ENV["IMAGEPATH"] + "gilt-cuff/totem/white-brown.jpg")
row.items.create! variation: (gilt_cuff.variations.create! name: "Yellow/Brown",   totem_image: ENV["IMAGEPATH"] + "gilt-cuff/totem/yellow-brown.jpg")
row.items.create! variation: (gilt_cuff.variations.create! name: "Yellow/Black",   totem_image: ENV["IMAGEPATH"] + "gilt-cuff/totem/yellow-black.jpg")
row.items.create! variation: (gilt_cuff.variations.create! name: "Yellow Stripes", totem_image: ENV["IMAGEPATH"] + "gilt-cuff/totem/yellow-stripes.jpg")


# row = TotemRow.create! index: 2
# hair_cuff = hair.products.create! name: "Hair Cuff"
# hair_cuff.sizes.create! name: "Small"
# hair_cuff.sizes.create! name: "Large"
# row.items.create! variation: (hair_cuff.variations.create! name: "Black",          totem_image: ENV["IMAGEPATH"] + "hair-cuff/totem/black.jpg")
# row.items.create! variation: (hair_cuff.variations.create! name: "Yellow Stripes", totem_image: ENV["IMAGEPATH"] + "hair-cuff/totem/yellow-stripes.jpg")
# row.items.create! variation: (hair_cuff.variations.create! name: "Yellow Leaf",    totem_image: ENV["IMAGEPATH"] + "hair-cuff/totem/yellow-leaf.jpg")
# row.items.create! variation: (hair_cuff.variations.create! name: "White Leaf",     totem_image: ENV["IMAGEPATH"] + "hair-cuff/totem/white-leaf.jpg")


row = TotemRow.create! index: 3
wrap_ring = rings.products.create! name: "Wrap Ring"
wrap_ring.sizes.create! name: "Tiny"
wrap_ring.sizes.create! name: "Small"
wrap_ring.sizes.create! name: "Medium"
wrap_ring.sizes.create! name: "Large"
row.items.create! variation: (wrap_ring.variations.create! name: "Black", totem_image: ENV["IMAGEPATH"] + "wrap-ring/totem/black.jpg")


row = TotemRow.create! index: 4
fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff"
fuzzy_cuff.sizes.create! name: "One Of A Kind"
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Painter", totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/painter.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Mo",      totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/mo.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Spook",   totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/spook.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Duster",  totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/duster.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Grumble", totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/grumble.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Tippy",   totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/tippy.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Wizen",   totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/wizen.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Chief",   totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/chief.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Fluffle", totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/fluffle.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Wiley",   totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/wiley.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Bean",    totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/bean.jpg")
row.items.create! variation: (fuzzy_cuff.variations.create! name: "Hunt",    totem_image: ENV["IMAGEPATH"] + "fuzzy-cuff/totem/hunt.jpg")


row = TotemRow.create! index: 5
cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet"
cc_bracelet.sizes.create! name: "Adjustable"
# row.items.create! variation: (cc_bracelet.variations.create! name: "Basic",           totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/basic.jpg")
# row.items.create! variation: (cc_bracelet.variations.create! name: "Amethyst",        totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/amethyst.jpg")
# row.items.create! variation: (cc_bracelet.variations.create! name: "Blue Lace Agate", totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/blue-lace-agate.jpg")
# row.items.create! variation: (cc_bracelet.variations.create! name: "Carnelian",       totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/carnelian.jpg")
row.items.create! variation: (cc_bracelet.variations.create! name: "Howlite",         totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/howlite.jpg")
row.items.create! variation: (cc_bracelet.variations.create! name: "Jasper",          totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/jasper.jpg")
row.items.create! variation: (cc_bracelet.variations.create! name: "Lapis Lazuli",    totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/lapis-lazuli.jpg")
row.items.create! variation: (cc_bracelet.variations.create! name: "Malachite",       totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/malachite.jpg")
# row.items.create! variation: (cc_bracelet.variations.create! name: "Onyx",            totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/onyx.jpg")
row.items.create! variation: (cc_bracelet.variations.create! name: "Pyrite",          totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/pyrite.jpg")
# row.items.create! variation: (cc_bracelet.variations.create! name: "Rose Quartz",     totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/rose-quartz.jpg")
row.items.create! variation: (cc_bracelet.variations.create! name: "Smoky Quartz",    totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/smoky-quartz.jpg")
# row.items.create! variation: (cc_bracelet.variations.create! name: "Tigers Eye",      totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-bracelet/totem/tigers-eye.jpg")
#
#
# row = TotemRow.create! index: 6
# cc_belt = belts.products.create! name: "Coffee & Crystals Belt"
# cc_bracelet.sizes.create! name: "Adjustable"
# row.items.create! variation: (cc_belt.variations.create! name: "Basic",           totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/basic.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Amethyst",        totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/amethyst.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Blue Lace Agate", totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/blue-lace-agate.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Carnelian",       totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/carnelian.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Howlite",         totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/howlite.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Jasper",          totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/jasper.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Lapis Lazuli",    totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/lapis-lazuli.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Malachite",       totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/malachite.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Onyx",            totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/onyx.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Pyrite",          totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/pyrite.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Rose Quartz",     totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/rose-quartz.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Smoky Quartz",    totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/smoky-quartz.jpg")
# row.items.create! variation: (cc_belt.variations.create! name: "Tigers Eye",      totem_image: ENV["IMAGEPATH"] + "coffee-and-crystals-belt/totem/tigers-eye.jpg")
#
#
# row = TotemRow.create! index: 7
# volva_belt = belts.products.create! name: "Volva Belt"
# volva_belt.sizes.create! name: "Medium"
# volva_belt.sizes.create! name: "Large"
# row.items.create! variation: (volva_belt.variations.create! name: "Rose",   totem_image: ENV["IMAGEPATH"] + "volva-belt/totem/rose.jpg")
# row.items.create! variation: (volva_belt.variations.create! name: "Indigo", totem_image: ENV["IMAGEPATH"] + "volva-belt/totem/indigo.jpg")
# row.items.create! variation: (volva_belt.variations.create! name: "Black",  totem_image: ENV["IMAGEPATH"] + "volva-belt/totem/black.jpg")
# row.items.create! variation: (volva_belt.variations.create! name: "Brown",  totem_image: ENV["IMAGEPATH"] + "volva-belt/totem/brown.jpg")
#
#
# row = TotemRow.create! index: 8
# seven_belt = belts.products.create! name: "7 Belt"
# seven_belt.sizes.create! name: "Small"
# seven_belt.sizes.create! name: "Medium"
# seven_belt.sizes.create! name: "Large"
# row.items.create! variation: (seven_belt.variations.create! name: "Rose",   totem_image: ENV["IMAGEPATH"] + "7-belt/totem/rose.jpg")
# row.items.create! variation: (seven_belt.variations.create! name: "Indigo", totem_image: ENV["IMAGEPATH"] + "7-belt/totem/indigo.jpg")
# row.items.create! variation: (seven_belt.variations.create! name: "Black",  totem_image: ENV["IMAGEPATH"] + "7-belt/totem/black.jpg")
# row.items.create! variation: (seven_belt.variations.create! name: "Brown",  totem_image: ENV["IMAGEPATH"] + "7-belt/totem/brown.jpg")
#
#
# row = TotemRow.create! index: 9
# thirteen_belt = belts.products.create! name: "13 Belt"
# seven_belt.sizes.create! name: "Medium"
# seven_belt.sizes.create! name: "Large"
# row.items.create! variation: (thirteen_belt.variations.create! name: "Rose",   totem_image: ENV["IMAGEPATH"] + "13-belt/totem/rose.jpg")
# row.items.create! variation: (thirteen_belt.variations.create! name: "Indigo", totem_image: ENV["IMAGEPATH"] + "13-belt/totem/indigo.jpg")
# row.items.create! variation: (thirteen_belt.variations.create! name: "Black",  totem_image: ENV["IMAGEPATH"] + "13-belt/totem/black.jpg")
# row.items.create! variation: (thirteen_belt.variations.create! name: "Brown",  totem_image: ENV["IMAGEPATH"] + "13-belt/totem/brown.jpg")


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

Event.create! name: "All Things Pretty", date: "April 30th to May 1st, 2016", location: "Red Deer, AB", description: "Booth #301"
