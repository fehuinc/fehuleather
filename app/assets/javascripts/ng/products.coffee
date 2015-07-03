angular.module "Products", []

.service "Products", (StubProducts)->
	return Products =
		
		all: ()->
			return StubProducts
		
