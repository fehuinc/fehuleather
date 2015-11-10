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
            { name: "Nude", wholesale: "/images/content/wholesale/raw-ring.jpg", totem: "/images/content/totem/raw-ring.jpg" }
          ]
        }
        
        # COFFEE AND CRYSTALS
        {
          name: "Coffee & Crystals Bracelet"
          ypos: 18
          variations: [
            { name: "Howlite",         wholesale: "/images/content/wholesale/coffee-and-crystals-howlite.jpg",         totem: "/images/content/totem/coffee-and-crystals-howlite.jpg" }
            { name: "Pyrite",          wholesale: "/images/content/wholesale/coffee-and-crystals-pyrite.jpg",          totem: "/images/content/totem/coffee-and-crystals-pyrite.jpg" }
            { name: "Green Turquoise", wholesale: "/images/content/wholesale/coffee-and-crystals-green-turquoise.jpg", totem: "/images/content/totem/coffee-and-crystals-green-turquoise.jpg" }
            { name: "Light Turquoise", wholesale: "/images/content/wholesale/coffee-and-crystals-light-turquoise.jpg", totem: "/images/content/totem/coffee-and-crystals-light-turquoise.jpg" }
            { name: "Malachite",       wholesale: "/images/content/wholesale/coffee-and-crystals-malachite.jpg",       totem: "/images/content/totem/coffee-and-crystals-malachite.jpg" }
            { name: "Lapis",           wholesale: "/images/content/wholesale/coffee-and-crystals-lapis.jpg",           totem: "/images/content/totem/coffee-and-crystals-lapis.jpg" }
            { name: "Jasper",          wholesale: "/images/content/wholesale/coffee-and-crystals-jasper.jpg",          totem: "/images/content/totem/coffee-and-crystals-jasper.jpg" }
            { name: "Smokey Quartz",   wholesale: "/images/content/wholesale/coffee-and-crystals-smokey-quartz.jpg",   totem: "/images/content/totem/coffee-and-crystals-smokey-quartz.jpg" }
            { name: "Goldstone",       wholesale: "/images/content/wholesale/coffee-and-crystals-goldstone.jpg",       totem: "/images/content/totem/coffee-and-crystals-goldstone.jpg" }
          ]
        }
        
        # WRAP CUFF
        
        {
          name: "Wrap Cuff"
          ypos: 25
          variations: [
            { name: "Bark",        wholesale: "/images/content/wholesale/wrap-cuff-bark-a.jpg",      totem: "/images/content/totem/wrap-cuff-bark-a.png" }
            { name: "Green",       wholesale: "/images/content/wholesale/wrap-cuff-green.jpg",       totem: "/images/content/totem/wrap-cuff-green.jpg" }
            { name: "Pink",        wholesale: "/images/content/wholesale/wrap-cuff-pink.jpg",        totem: "/images/content/totem/wrap-cuff-pink.jpg" }
            { name: "Pumpkin",     wholesale: "/images/content/wholesale/wrap-cuff-pumpkin.jpg",     totem: "/images/content/totem/wrap-cuff-pumpkin.jpg" }
            { name: "Slate",       wholesale: "/images/content/wholesale/wrap-cuff-slate.jpg",       totem: "/images/content/totem/wrap-cuff-slate.png" }
            { name: "Turq",        wholesale: "/images/content/wholesale/wrap-cuff-turq.jpg",        totem: "/images/content/totem/wrap-cuff-turq.jpg" }
            { name: "Orangesicle", wholesale: "/images/content/wholesale/wrap-cuff-orangesicle.jpg", totem: "/images/content/totem/wrap-cuff-orangesicle.jpg" }
            { name: "Violet",      wholesale: "/images/content/wholesale/wrap-cuff-violet.jpg",      totem: "/images/content/totem/wrap-cuff-violet.jpg" }
          ]
        }
        
        # FUZZY CUFF
        {
          name: "Fuzzy Cuff"
          ypos: 33
          variations: [
            { name: "Painter", wholesale: "/images/content/wholesale/fuzzy-cuff-1.jpg",  totem: "/images/content/totem/fuzzy-cuff-1.jpg" }
            { name: "Mo",      wholesale: "/images/content/wholesale/fuzzy-cuff-2.jpg",  totem: "/images/content/totem/fuzzy-cuff-2.jpg" }
            { name: "Spook",   wholesale: "/images/content/wholesale/fuzzy-cuff-3.jpg",  totem: "/images/content/totem/fuzzy-cuff-3.jpg" }
            { name: "Duster",  wholesale: "/images/content/wholesale/fuzzy-cuff-4.jpg",  totem: "/images/content/totem/fuzzy-cuff-4.jpg" }
            { name: "Grumble", wholesale: "/images/content/wholesale/fuzzy-cuff-5.jpg",  totem: "/images/content/totem/fuzzy-cuff-5.jpg" }
            { name: "Tippy",   wholesale: "/images/content/wholesale/fuzzy-cuff-6.jpg",  totem: "/images/content/totem/fuzzy-cuff-6.jpg" }
            { name: "Wizen",   wholesale: "/images/content/wholesale/fuzzy-cuff-7.jpg",  totem: "/images/content/totem/fuzzy-cuff-7.jpg" }
            { name: "Chief",   wholesale: "/images/content/wholesale/fuzzy-cuff-8.jpg",  totem: "/images/content/totem/fuzzy-cuff-8.jpg" }
            { name: "Fluffle", wholesale: "/images/content/wholesale/fuzzy-cuff-9.jpg",  totem: "/images/content/totem/fuzzy-cuff-9.jpg" }
            { name: "Wiley",   wholesale: "/images/content/wholesale/fuzzy-cuff-10.jpg", totem: "/images/content/totem/fuzzy-cuff-10.jpg" }
            { name: "Bean",    wholesale: "/images/content/wholesale/fuzzy-cuff-11.jpg", totem: "/images/content/totem/fuzzy-cuff-11.jpg" }
            { name: "Hunt",    wholesale: "/images/content/wholesale/fuzzy-cuff-12.jpg", totem: "/images/content/totem/fuzzy-cuff-12.jpg" }
          ]
        }
      ]
      
      return deferred.promise
