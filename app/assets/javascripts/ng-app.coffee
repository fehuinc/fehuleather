angular.module "Core", [
  # Libs
  "ngRoute"
  "ngTouch"
  
  # Components
  "Deleter"
  "Editable"
  
  # Scripts
  "bimg"
]

angular.module "FehuApp", [
  # Also include Core
  "Core"
  
  # Components
  "Product"
  "ProductInfo"
  "Variations"
  
  # Pages
  "About"
  "Events"
  "Locations"
  "Shop"
  
  # Scripts
  "PageStyle"
  "Products"
  "Routes"
  "StubProducts"
  "StubLocations"
]

.config new Array "$locationProvider", ($locationProvider)->
  $locationProvider.html5Mode enabled:true, requireBase:false
