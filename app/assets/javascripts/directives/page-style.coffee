angular.module "PageStyle", []

.directive "pageStyle", new Array "$rootScope", "$location", ($rootScope, $location)->
   (scope, elm, attrs)->
      scope.$on "$routeChangeSuccess", ()->
         path = $location.path().split("/")[1]
         if path is "" then path = "shop"
         elm.prop "id", path
