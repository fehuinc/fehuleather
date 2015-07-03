angular.module "Products", []

.service "Products", new Array "StubProducts", (StubProducts)->
  return Products =
    
    all: ()->
      return StubProducts
    
