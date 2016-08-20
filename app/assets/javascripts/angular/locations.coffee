angular.module "Locations", []

.controller "LocationsCtrl", new Array "$scope", ($scope)->
  $scope.locations = FEHU.locations
  $scope.countries = {}
  $scope.searchProvinces = []
  $scope.allProvinces = "Show All"
  $scope.searchProvince = $scope.allProvinces
  
  for location in $scope.locations
    country = $scope.countries[location.country] ?= {}
    province = country[location.province] ?= []
    province.push(location)
  
  for name, country of $scope.countries
    for province of country
      $scope.searchProvinces.push province
  
  $scope.searchProvinces = $scope.searchProvinces.sort()
  $scope.searchProvinces.unshift($scope.allProvinces)
  
  $scope.showProvince = (input)->
    switch $scope.searchProvince
      when $scope.allProvinces then true
      when input then true
      else false
