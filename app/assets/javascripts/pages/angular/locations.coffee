angular.module "Locations", []

.controller "LocationsCtrl", ($scope, StubLocations)->
  $scope.locations = StubLocations
  $scope.countries = {}
  $scope.allProvinces = "Province"
  $scope.searchProvince = $scope.allProvinces
  
  for location in $scope.locations
    country = $scope.countries[location.country] ?= {}
    province = country[location.province] ?= []
    province.push(location)
  
  $scope.searchProvinces = (province for province of $scope.countries["Canada"])
  $scope.searchProvinces = $scope.searchProvinces.sort()
  $scope.searchProvinces.unshift($scope.allProvinces)
  
  $scope.showProvince = (input)->
    switch $scope.searchProvince
      when $scope.allProvinces then true
      when input then true
      else false
  
  colorArr = ["A","B","C","D"]
  $scope.colorClass = (index)->
    return colorArr[index%4]
      
