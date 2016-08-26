bracelets = Kingdom.create! name: "Bracelet"

row = TotemRow.create! index: 0
fuzzy_cuff = bracelets.products.create! name: "Fuzzy Cuff", price_retail_cents: 6400, price_wholesale_cents: 2400, wholesale_description: "You should order about 100 of these for your store. That'd be <small>sooo</small> <em>HOOT!</em>."
fuzzy_cuff.infos.create! name: "Sizing", content: "Not too big, not too small. Pretty good overall."
fuzzy_cuff.infos.create! name: "Features", content: "Slices, dices."
fuzzy_cuff.sizes.create! name: "One Of A Kind"
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Painter", totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/painter.jpg"),  fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Mo",      totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/mo.jpg"),       fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Spook",   totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/spook.jpg"),    fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Duster",  totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/duster.jpg"),   fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Grumble", totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/grumble.jpg"),  fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Tippy",   totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/tippy.jpg"),    fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Wizen",   totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/wizen.jpg"),    fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Chief",   totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/chief.jpg"),    fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Fluffle", totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/fluffle.jpg"),  fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Wiley",   totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/wiley.jpg"),    fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Bean",    totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/bean.jpg"),     fuzzy_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((fuzzy_cuff.variations.create! name: "Hunt",    totem_image: ENV.fetch("IMAGEPATH") + "fuzzy-cuff/totem/hunt.jpg"),     fuzzy_cuff.sizes)

row = TotemRow.create! index: 1
cc_bracelet = bracelets.products.create! name: "Coffee & Crystals Bracelet", price_retail_cents: 6400, price_wholesale_cents: 2400, wholesale_description: "You should order about 100 of these for your store. That'd be <small>sooo</small> <em>HOOT!</em>."
cc_bracelet.infos.create! name: "Sizing", content: "Not too big, not too small. Pretty good overall."
cc_bracelet.infos.create! name: "Features", content: "Slices, dices."
cc_bracelet.sizes.create! name: "Adjustable"
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Howlite",         totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/howlite.jpg"),         cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Jasper",          totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/jasper.jpg"),          cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Lapis Lazuli",    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/lapis-lazuli.jpg"),    cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Malachite",       totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/malachite.jpg"),       cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Pyrite",          totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/pyrite.jpg"),          cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Smoky Quartz",    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/smoky-quartz.jpg"),    cc_bracelet.sizes)


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

Event.create! name: "Spruce Meadows: Masters",        date: "September 7th to 11th, 2016", location: "Calgary, AB", website: "http://www.sprucemeadows.com/tournaments/ex_maps.jsp?id=29", description: "18011 Spruce Meadows Way SW RR 9 LCD 8<br>Calgary, AB T2J 5G5"
