angular.module "FehuApp", [
   # Libs
   "ngRoute"
   "ngTouch"
   
   # Components
   "Product"
   "ProductInfo"
   "Variations"
   
   # Pages
   "Locations"
   "Shop"
   "Wholesale"
   
   # Scripts
   "bimg"
   "PageStyle"
   "Products"
   "Routes"
   "StubProducts"
]

.config ($locationProvider)->
  $locationProvider.html5Mode enabled:true, requireBase:false
