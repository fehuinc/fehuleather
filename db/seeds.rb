row = TotemRow.create! index: 0
cc_bracelet = Product.create! name: "Coffee & Crystals Bracelet", price_retail_cents: 9800, price_wholesale_cents: 3400
cc_bracelet.infos.create! name: "Sizing", content: "Not too big, not too small. Pretty good overall."
cc_bracelet.infos.create! name: "Features", content: "Slices, dices."
cc_bracelet.sizes.create! name: "Adjustable"
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Angelite", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/angelite.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/angelite.jpg"), cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Basic", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/basic.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/basic.jpg", adjust_retail_cents: -3400, adjust_wholesale_cents: -1200), cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Hypersthene", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/hypersthene.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/hypersthene.jpg"), cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Labradorite", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/labradorite.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/labradorite.jpg"), cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Pyrite", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/pyrite.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/pyrite.jpg"), cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Tourmaline", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/tourmaline.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/tourmaline.jpg"), cc_bracelet.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_bracelet.variations.create! name: "Lapis", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/lapis.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/lapis.jpg"), cc_bracelet.sizes)

row = TotemRow.create! index: 1
cc_belt = Product.create! name: "Coffee & Crystals Belt", price_retail_cents: 21900, price_wholesale_cents: 8000
cc_belt.infos.create! name: "Sizing", content: "Not too big, not too small. Pretty good overall."
cc_belt.infos.create! name: "Features", content: "Slices, dices."
cc_belt.sizes.create! name: "Adjustable"
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Angelite", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/angelite.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/angelite.jpg"), cc_belt.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Basic", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/basic.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/basic.jpg", adjust_retail_cents: -13500, adjust_wholesale_cents: -4800), cc_belt.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Hypersthene", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/hypersthene.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/hypersthene.jpg"), cc_belt.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Labradorite", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/labradorite.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/labradorite.jpg"), cc_belt.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Pyrite", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/pyrite.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/pyrite.jpg"), cc_belt.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Tourmaline", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/tourmaline.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/tourmaline.jpg"), cc_belt.sizes)
row.items.create! variation: BuildMaker.make_build_pair((cc_belt.variations.create! name: "Lapis", totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/lapis.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/lapis.jpg"), cc_belt.sizes)

row = TotemRow.create! index: 2
gilt_cuff = Product.create! name: "Gilt Cuff", price_retail_cents: 8400, price_wholesale_cents: 3200
gilt_cuff.infos.create! name: "Sizing", content: "Not too big, not too small. Pretty good overall."
gilt_cuff.infos.create! name: "Features", content: "Slices, dices."
gilt_cuff.sizes.create! name: "Adjustable"
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Taupe with Yellow Gold", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/yellow-taupe.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/yellow-taupe.jpg"), gilt_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Taupe with White Gold", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/white-taupe.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/white-taupe.jpg"), gilt_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Brown with Yellow Gold", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/yellow-brown.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/yellow-brown.jpg"), gilt_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Brown with White Gold", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/white-brown.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/white-brown.jpg"), gilt_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Black with Yellow Gold", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/yellow-black.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/yellow-black.jpg"), gilt_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Black with White Gold", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/white-black.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/white-black.jpg"), gilt_cuff.sizes)
row.items.create! variation: BuildMaker.make_build_pair((gilt_cuff.variations.create! name: "Black with Yellow Gold Stripes", totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/stripes-black.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/stripes-black.jpg"), gilt_cuff.sizes)

bunch_bracelet = Product.create! name: "Bunch Bracelet", price_retail_cents: 8400, price_wholesale_cents: 3200
bunch_bracelet.infos.create! name: "Sizing", content: "Not too big, not too small. Pretty good overall."
bunch_bracelet.infos.create! name: "Features", content: "Slices, dices."
bunch_bracelet.sizes.create! name: "Adjustable"
BuildMaker.make_build_pair((bunch_bracelet.variations.create! name: "Moss Green", totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/moss-green.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/moss-green.jpg"), bunch_bracelet.sizes)
BuildMaker.make_build_pair((bunch_bracelet.variations.create! name: "Raw", totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/raw.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/raw.jpg"), bunch_bracelet.sizes)
BuildMaker.make_build_pair((bunch_bracelet.variations.create! name: "Black", totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/black.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/black.jpg"), bunch_bracelet.sizes)
BuildMaker.make_build_pair((bunch_bracelet.variations.create! name: "Dark Brown", totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/dark-brown.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/dark-brown.jpg"), bunch_bracelet.sizes)
BuildMaker.make_build_pair((bunch_bracelet.variations.create! name: "Gray", totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/gray.jpg", wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/gray.jpg"), bunch_bracelet.sizes)


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

Event.create! name: "Etsy: Made In Canada - Calgary Market", date: "Sep 23-24", location: "Genesis Wellness Center, Calgary, AB", website: "https://www.etsy.com/ca/local/event/41783220462/etsy-made-in-canada-calgary-market-september-23", description: "Two day pop-up market featuring handmade and vintage Etsy shops from Calgary, Alberta and surrounding area."
Event.create! name: "All Things Pretty Market Goes Country", date: "Oct 1-2", location: "Lacombe, AB", website: "https://www.facebook.com/events/220711668278745/", description: "Join us at The Big Red Barn in Lacombe, AB again for our Fall Market! Vintage, Shabby Chic, Handmade, Sewn, Antique, Farm Grown, Curated, Designed, and Created goods 50+ Indoor and Outdoor vendors, food trucks, fresh and local produce."
Event.create! name: "All Things Pretty Christmas Market", date: "Nov 18-19", location: "Red Deer, AB", website: "https://www.facebook.com/events/1087080984687616/", description: "The All Things Pretty Market brings you our Christmas Edition! Handcrafters, Designers, Shabby Chicers, Jewelers, Curators, Sewers, Growers and Creators all together in one place for you to shop and experience the most unique event in Central Alberta."
