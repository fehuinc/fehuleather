angular.module "StubProducts", []

.service "StubProducts", new Array "$q", ($q)->
  return StubProducts =
    all: ()->
      deferred = $q.defer()
      deferred.resolve [
        # RAW RING
        {
          name: "Raw Ring"
          ypos: 23
          variations: [
            { name: "Nude", white: "/images/content/white/raw-ring.jpg", hero: "/images/content/hero/raw-ring.jpg" }
          ]
        }
        
        # COFFEE AND CRYSTALS
        {
          name: "Coffee & Crystals Bracelet"
          ypos: 18
          variations: [
            { name: "Howlite",         white: "/images/content/white/coffee-and-crystals-howlite.jpg",         hero: "/images/content/hero/coffee-and-crystals-howlite.jpg" }
            { name: "Pyrite",          white: "/images/content/white/coffee-and-crystals-pyrite.jpg",          hero: "/images/content/hero/coffee-and-crystals-pyrite.jpg" }
            { name: "Green Turquoise", white: "/images/content/white/coffee-and-crystals-green-turquoise.jpg", hero: "/images/content/hero/coffee-and-crystals-green-turquoise.jpg" }
            { name: "Light Turquoise", white: "/images/content/white/coffee-and-crystals-light-turquoise.jpg", hero: "/images/content/hero/coffee-and-crystals-light-turquoise.jpg" }
            { name: "Malachite",       white: "/images/content/white/coffee-and-crystals-malachite.jpg",       hero: "/images/content/hero/coffee-and-crystals-malachite.jpg" }
            { name: "Lapis",           white: "/images/content/white/coffee-and-crystals-lapis.jpg",           hero: "/images/content/hero/coffee-and-crystals-lapis.jpg" }
            { name: "Jasper",          white: "/images/content/white/coffee-and-crystals-jasper.jpg",          hero: "/images/content/hero/coffee-and-crystals-jasper.jpg" }
            { name: "Smokey Quartz",   white: "/images/content/white/coffee-and-crystals-smokey-quartz.jpg",   hero: "/images/content/hero/coffee-and-crystals-smokey-quartz.jpg" }
            { name: "Goldstone",       white: "/images/content/white/coffee-and-crystals-goldstone.jpg",       hero: "/images/content/hero/coffee-and-crystals-goldstone.jpg" }
          ]
        }
        
        # WRAP CUFF
        
        {
          name: "Wrap Cuff"
          ypos: 25
          variations: [
            { name: "Bark",        white: "/images/content/white/wrap-cuff-bark-a.jpg",      hero: "/images/content/hero/wrap-cuff-bark-a.png" }
            { name: "Green",       white: "/images/content/white/wrap-cuff-green.jpg",       hero: "/images/content/hero/wrap-cuff-green.jpg" }
            { name: "Pink",        white: "/images/content/white/wrap-cuff-pink.jpg",        hero: "/images/content/hero/wrap-cuff-pink.jpg" }
            { name: "Pumpkin",     white: "/images/content/white/wrap-cuff-pumpkin.jpg",     hero: "/images/content/hero/wrap-cuff-pumpkin.jpg" }
            { name: "Slate",       white: "/images/content/white/wrap-cuff-slate.jpg",       hero: "/images/content/hero/wrap-cuff-slate.png" }
            { name: "Turq",        white: "/images/content/white/wrap-cuff-turq.jpg",        hero: "/images/content/hero/wrap-cuff-turq.jpg" }
            { name: "Orangesicle", white: "/images/content/white/wrap-cuff-orangesicle.jpg", hero: "/images/content/hero/wrap-cuff-orangesicle.jpg" }
            { name: "Violet",      white: "/images/content/white/wrap-cuff-violet.jpg",      hero: "/images/content/hero/wrap-cuff-violet.jpg" }
          ]
        }
        
        # FUZZY CUFF
        {
          name: "Fuzzy Cuff"
          ypos: 33
          variations: [
            { name: "Painter", white: "/images/content/white/fuzzy-cuff-1.jpg",  hero: "/images/content/hero/fuzzy-cuff-1.jpg" }
            { name: "Mo",      white: "/images/content/white/fuzzy-cuff-2.jpg",  hero: "/images/content/hero/fuzzy-cuff-2.jpg" }
            { name: "Spook",   white: "/images/content/white/fuzzy-cuff-3.jpg",  hero: "/images/content/hero/fuzzy-cuff-3.jpg" }
            { name: "Duster",  white: "/images/content/white/fuzzy-cuff-4.jpg",  hero: "/images/content/hero/fuzzy-cuff-4.jpg" }
            { name: "Grumble", white: "/images/content/white/fuzzy-cuff-5.jpg",  hero: "/images/content/hero/fuzzy-cuff-5.jpg" }
            { name: "Tippy",   white: "/images/content/white/fuzzy-cuff-6.jpg",  hero: "/images/content/hero/fuzzy-cuff-6.jpg" }
            { name: "Wizen",   white: "/images/content/white/fuzzy-cuff-7.jpg",  hero: "/images/content/hero/fuzzy-cuff-7.jpg" }
            { name: "Chief",   white: "/images/content/white/fuzzy-cuff-8.jpg",  hero: "/images/content/hero/fuzzy-cuff-8.jpg" }
            { name: "Fluffle", white: "/images/content/white/fuzzy-cuff-9.jpg",  hero: "/images/content/hero/fuzzy-cuff-9.jpg" }
            { name: "Wiley",   white: "/images/content/white/fuzzy-cuff-10.jpg", hero: "/images/content/hero/fuzzy-cuff-10.jpg" }
            { name: "Bean",    white: "/images/content/white/fuzzy-cuff-11.jpg", hero: "/images/content/hero/fuzzy-cuff-11.jpg" }
            { name: "Hunt",    white: "/images/content/white/fuzzy-cuff-12.jpg", hero: "/images/content/hero/fuzzy-cuff-12.jpg" }
          ]
        }
      ]
      
      return deferred.promise
