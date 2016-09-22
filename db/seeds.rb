row = TotemRow.create! index: 0
cc_bracelet = Product.create! name: "Coffee & Crystals Bracelet",
                              price_retail_cents: 98 * 100,
                              price_wholesale_cents: 34 * 100,
                              description_retail: "<h4>Life with a Coffee and Crystals Bracelet</h4>\n<p>Our bracelets are made from the same type of leather as saddles. They take about a week to break in, gradually moulding to the wrist and becoming buttery soft. The raw leather darkens to a rich coffee with time.</p>\n\n<h4>Sizing</h4>\n<p>A Coffee & Crystals bracelet may be adjusted to fit any size wrist, and can be worn snugly-tight or slacked off.</p>\n\n<h4>Uniqueness</h4>\n<p>Every Coffee & Crystals bracelet is individually hand cut, hand dyed, and hand sewn. Your Coffee & Crystals bracelet will be one of a kind, similar to but distinguishable from the bracelet photos featured up above.</p>",
                              description_wholesale: "<h4>Life with a Coffee and Crystals Bracelet</h4>\n<p>Our bracelets are made from the same type of leather as saddles. They take about a week to break in, gradually moulding to the wrist and becoming buttery soft. The raw leather darkens to a rich coffee with time.</p>\n\n<h4>Sizing</h4>\n<p>A Coffee & Crystals bracelet may be adjusted to fit any size wrist, and can be worn snugly-tight or slacked off.</p>\n\n<h4>Uniqueness</h4>\n<p>Every Coffee & Crystals bracelet is individually hand cut, hand dyed, and hand sewn. Your Coffee & Crystals bracelet will be one of a kind, similar to but distinguishable from the bracelet photos featured up above.</p>"
cc_bracelet.sizes.create! name: "Adjustable"

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Angelite",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/angelite.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/angelite.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and angelite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and angelite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you."),
  cc_bracelet.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Stitch",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/basic.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/basic.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather stitched together with three large cross stitches. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather stitched together with three large cross stitches. Perfect for wearing on long, dusty trails or wherever life takes you.",
    adjust_retail_cents: -34 * 100,
    adjust_wholesale_cents: -12 * 100),
  cc_bracelet.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Hypersthene",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/hypersthene.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/hypersthene.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and hypersthene gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and hypersthene gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you."),
  cc_bracelet.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Labradorite",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/labradorite.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/labradorite.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and labradorite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and labradorite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you."),
  cc_bracelet.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Pyrite",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/pyrite.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/pyrite.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and pyrite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and pyrite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you."),
  cc_bracelet.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Tourmaline",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/tourmaline.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/tourmaline.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and tourmaline gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and tourmaline gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you."),
  cc_bracelet.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_bracelet.variations.create!(
    name: "Lapis",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/totem/lapis.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-bracelet/wholesale/lapis.jpg",
    description_retail: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and lapis gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Bracelet is made from full-grain vegetable tanned leather and lapis gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you."),
  cc_bracelet.sizes)



row = TotemRow.create! index: 1
cc_belt = Product.create! name: "Coffee & Crystals Belt",
                          price_retail_cents: 219 * 100,
                          price_wholesale_cents: 80 * 100,
                          description_retail: "<h4>Life with a Coffee and Crystals Belt</h4>\n<p>Our belts are made from the same type of leather as saddles. They take about a week to break in, gradually becoming buttery soft. The raw leather darkens to a rich coffee with time.</p>\n\n<h4>Sizing</h4>\n<p>A Coffee & Crystals belt may be adjusted to fit any size waist, double wrapping on smaller waists.</p>\n\n<h4>Uniqueness</h4>\n<p>Every Coffee & Crystals belt is individually hand cut, hand dyed, and hand sewn. Your Coffee & Crystals belt will be one of a kind, similar to but distinguishable from the belt photos featured up above.</p>",
                          description_wholesale: "<h4>Life with a Coffee and Crystals Belt</h4>\n<p>Our belts are made from the same type of leather as saddles. They take about a week to break in, gradually becoming buttery soft. The raw leather darkens to a rich coffee with time.</p>\n\n<h4>Sizing</h4>\n<p>A Coffee & Crystals belt may be adjusted to fit any size waist, double wrapping on smaller waists.</p>\n\n<h4>Uniqueness</h4>\n<p>Every Coffee & Crystals belt is individually hand cut, hand dyed, and hand sewn. Your Coffee & Crystals belt will be one of a kind, similar to but distinguishable from the belt photos featured up above.</p>"
cc_belt.sizes.create! name: "Adjustable"

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Angelite",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/angelite.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/angelite.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural angelite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural angelite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads."),
  cc_belt.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Stitch",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/basic.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/basic.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather stitched together with three large cross stitches. The leather is marbled with coffee. Perfect for wearing on long, dusty trails or wherever life takes you.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather stitched together with three large cross stitches. The leather is marbled with coffee. Perfect for wearing on long, dusty trails or wherever life takes you.",
    adjust_retail_cents: -135 * 100,
    adjust_wholesale_cents: -48 * 100),
  cc_belt.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Hypersthene",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/hypersthene.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/hypersthene.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural hypersthene gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural hypersthene gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads."),
  cc_belt.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Labradorite",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/labradorite.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/labradorite.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural labradorite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural labradorite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads."),
  cc_belt.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Pyrite",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/pyrite.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/pyrite.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural pyrite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural pyrite gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads."),
  cc_belt.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Tourmaline",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/tourmaline.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/tourmaline.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural tourmaline gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural tourmaline gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads."),
  cc_belt.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  cc_belt.variations.create!(
    name: "Lapis",
    totem_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/totem/lapis.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "coffee-and-crystals-belt/wholesale/lapis.jpg",
    description_retail: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural lapis gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads.",
    description_wholesale: "The Coffee & Crystals Leather Belt is made from full-grain vegetable tanned leather and natural lapis gemstones. The leather is marbled with coffee, and I hand-sew the gemstones. Perfect for wearing on long, dusty trails or wherever life takes you. Take a peak at the bracelet pics to get a better idea of how the gemstones will look. The belts include 3 gemstone clusters for a total of 15 beads."),
  cc_belt.sizes)



row = TotemRow.create! index: 2
gilt_cuff = Product.create! name: "Gilt Cuff",
                            price_retail_cents: 84 * 100,
                            price_wholesale_cents: 32 * 100,
                            description_retail: "<h4>Life with a Wrap Cuff</h4>\n<p>Our bracelets are made from the same type of leather as saddles. They take about a week to break in, gradually moulding to the wrist and becoming buttery soft. </p>\n\n<h4>Sizing</h4>\n<p>Our wrap cuff is fully adjustable, fitting comfortably between six and eight inches, with a width of about an inch and a half.</p>\n\n<h4>Uniqueness</h4>\n<p>Every wrap cuff is individually hand cut, hand dyed, and hand finished. Your wrap cuff will be one of a kind, similar to but distinguishable from the cuff photos featured up above.</p>",
                            description_wholesale: "<h4>Life with a Wrap Cuff</h4>\n<p>Our bracelets are made from the same type of leather as saddles. They take about a week to break in, gradually moulding to the wrist and becoming buttery soft. </p>\n\n<h4>Sizing</h4>\n<p>Our wrap cuff is fully adjustable, fitting comfortably between six and eight inches, with a width of about an inch and a half.</p>\n\n<h4>Uniqueness</h4>\n<p>Every wrap cuff is individually hand cut, hand dyed, and hand finished. Your wrap cuff will be one of a kind, similar to but distinguishable from the cuff photos featured up above.</p>"
gilt_cuff.sizes.create! name: "Adjustable"

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Taupe with Yellow Gold",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/yellow-taupe.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/yellow-taupe.jpg",
    description_retail: "This taupe leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm grey. The 23 carat yellow gold marbling has been applied using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This taupe leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm grey. The 23 carat yellow gold marbling has been applied using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Taupe with White Gold",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/white-taupe.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/white-taupe.jpg",
    description_retail: "This taupe leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm grey. The 18 carat white gold marbling has been applied using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This taupe leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm grey. The 18 carat white gold marbling has been applied using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Brown with Yellow Gold",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/yellow-brown.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/yellow-brown.jpg",
    description_retail: "This brown leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm brown. The 23 carat yellow gold marbling has been applied using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This brown leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm brown. The 23 carat yellow gold marbling has been applied using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Brown with White Gold",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/white-brown.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/white-brown.jpg",
    description_retail: "This brown leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm brown. The 18 carat white gold marbling has been applied using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This brown leather bracelet is made from full-grain vegetable tanned leather, hand dyed with plant extracts to a warm brown. The 18 carat white gold marbling has been applied using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Black with Yellow Gold",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/yellow-black.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/yellow-black.jpg",
    description_retail: "This black leather bracelet is made from full-grain vegetable tanned leather, hand dyed to a cool (blue) black. The black colour \"Vinegar Black\" is a recipe from an 18th century harness makers manual. The 22 carat gold marbling has been applied using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This black leather bracelet is made from full-grain vegetable tanned leather, hand dyed to a cool (blue) black. The black colour \"Vinegar Black\" is a recipe from an 18th century harness makers manual. The 22 carat gold marbling has been applied using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Black with White Gold",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/white-black.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/white-black.jpg",
    description_retail: "This black leather bracelet is made from full-grain vegetable tanned leather, hand dyed to a cool (blue) black. The black colour \"Vinegar Black\" is a recipe from an 18th century harness makers manual. The 18 carat white gold marbling has been applied using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This black leather bracelet is made from full-grain vegetable tanned leather, hand dyed to a cool (blue) black. The black colour \"Vinegar Black\" is a recipe from an 18th century harness makers manual. The 18 carat white gold marbling has been applied using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)

row.items.create! variation: BuildMaker.make_build_pair(
  gilt_cuff.variations.create!(
    name: "Black with Yellow Gold Stripes",
    totem_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/totem/stripes-black.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "gilt-cuff/wholesale/stripes-black.jpg",
    description_retail: "This black leather bracelet with gold stripes is made from full-grain vegetable tanned leather, hand dyed to a cool (blue) black. The black colour \"Vinegar Black\" is a recipe from an 18th century harness makers manual. The 22 carat gold stripes have been embossed using the same techniques as the Florentine book binders of years past.",
    description_wholesale: "This black leather bracelet with gold stripes is made from full-grain vegetable tanned leather, hand dyed to a cool (blue) black. The black colour \"Vinegar Black\" is a recipe from an 18th century harness makers manual. The 22 carat gold stripes have been embossed using the same techniques as the Florentine book binders of years past."),
  gilt_cuff.sizes)



bunch_bracelet = Product.create! name: "Bunch Bracelet",
                                 price_retail_cents: 84 * 100,
                                 price_wholesale_cents: 32 * 100,
                                 description_retail: "The Bunch Bracelet is made from full-grain vegetable tanned leather cut into thin strips, hand dyed using plant extracts. The front of the bracelet features 7 strips, while the back closes with a simple slip knot.",
                                 description_wholesale: "The Bunch Bracelet is made from full-grain vegetable tanned leather cut into thin strips, hand dyed using plant extracts. The front of the bracelet features 7 strips, while the back closes with a simple slip knot."
bunch_bracelet.sizes.create! name: "Adjustable"

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Moss Green",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/moss-green.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/moss-green.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Black",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/black.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/black.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Brown",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/brown.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/brown.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Dark Brown",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/dark-brown.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/dark-brown.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Dark Grey",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/dark-grey.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/dark-grey.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Light Grey",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/light-grey.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/light-grey.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Mauve",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/mauve.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/mauve.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Nude",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/nude.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/nude.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)

BuildMaker.make_build_pair(
  bunch_bracelet.variations.create!(
    name: "Yellow",
    totem_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/totem/yellow.jpg",
    wholesale_image: ENV.fetch("IMAGEPATH") + "bunch-bracelet/wholesale/yellow.jpg",
    description_retail: "",
    description_wholesale: ""),
  bunch_bracelet.sizes)



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
