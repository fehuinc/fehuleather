angular.module "Order", []

.service "Order", new Array "$http", "$rootScope", ($http, $rootScope)->
  $rootScope.previewItems = {}
  $rootScope.previewItemsCount = 0
  
  createPreviewItem = (editorItem)->
    return previewItem =
      build_id: editorItem.build_id
      name: editorItem.name
      cents: editorItem.cents
      image: editorItem.image
      quantity: editorItem.quantity
  
  return Order =
    
    initItems: (items)->
      for item in items
        $rootScope.previewItems[item.build_id] = item
      Order.updateItemsCount()
    
    
    update: (editorItem)->
      $rootScope.updatingItems = true
      
      $http.patch "/wholesale/update_order/#{editorItem.build_id}", quantity: editorItem.quantity
        
        .then (resp)->
          newQuantity = resp.data
          
          alert "Something went wrong — sorry!" if newQuantity isnt editorItem.quantity
          
          if newQuantity > 0
            $rootScope.previewItems[editorItem.build_id] ?= createPreviewItem(editorItem)
            $rootScope.previewItems[editorItem.build_id].quantity = newQuantity
          else
            delete $rootScope.previewItems[editorItem.build_id]
        
        .catch (resp)->
          document.body.parentNode.innerHTML = resp.data
        
        .finally ()->
          $rootScope.updatingItems = false
          Order.updateItemsCount()


    updateItemsCount: ()->
      $rootScope.previewItemsCount = 0
      for k, v of $rootScope.previewItems
        $rootScope.previewItemsCount++
