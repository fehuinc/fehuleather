angular.module "ShopInfo", []

.run new Array "$rootScope", ($rootScope)->
  $rootScope.shopInfos = [
    {name: "Payment", content: "You can pay with your own blood!"}
    {name: "Shipping", content: "We don't actually use ships."}
    {name: "Returns", content: "The return statement lets you get data back out of a function."}
    {name: "Questions", content: "Answers"}
  ]
