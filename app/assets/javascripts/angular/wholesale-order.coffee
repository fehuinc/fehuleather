angular.module "WholesaleOrder", []

.service "WholesaleOrder", new Array "$http", "$rootScope", ($http, $rootScope)->
  $rootScope.previewItems = {} # Uses build id as key
  $rootScope.sortedPreviewItems = []
  $rootScope.previewItemsCount = 0
  
  ajaxQueue = {}
  tempItemId = 1000000000
  
  sorter = (a, b)->
    (a > b) - (b > a) # From Stack Overflow, of course
  
  render = ()->
    $rootScope.sortedPreviewItems = (v for k, v of $rootScope.previewItems).sort((a, b)-> sorter a.item_id, b.item_id).reverse()
    $rootScope.previewItemsCount = $rootScope.sortedPreviewItems.length
  
  createPreviewItemFromOrderItem = (orderItem)->
    return previewItem =
      item_id: orderItem.id
      build_id: orderItem.build.id
      product_id: orderItem.build.product.id
      product_name: orderItem.build.product.name
      size_name: orderItem.build.size.name
      variation_name: orderItem.build.variation.name
      prices: orderItem.build.wholesale_prices
      image: orderItem.build.variation.wholesale_image
      quantity: orderItem.quantity
  
  createPreviewItemFromEditorBuild = (editorBuild)->
    return previewItem =
      build_id: editorBuild.build_id
      product_id: editorBuild.product_id
      product_name: editorBuild.product_name
      size_name: editorBuild.size_name
      variation_name: editorBuild.variation_name
      prices: editorBuild.prices
      image: editorBuild.image
  
  updateQuantity = (editorBuild, newQuantity)->
    if newQuantity > 0
      $rootScope.previewItems[editorBuild.build_id] ?= createPreviewItemFromEditorBuild(editorBuild)
      $rootScope.previewItems[editorBuild.build_id].item_id ?= tempItemId++
      $rootScope.previewItems[editorBuild.build_id].quantity = newQuantity
    else
      delete $rootScope.previewItems[editorBuild.build_id]
    render()
  
  ajaxUpdate = (editorBuild)->
    $rootScope.updatingItems = true
    
    $http.patch "/wholesale/update_order/#{editorBuild.build_id}",
      quantity: editorBuild.quantity
    
    .then (resp)->
      updateQuantity editorBuild, resp.data
      
    .catch (resp)->
      alert "An error has occurred. Please reload the page."
      # document.body.parentNode.innerHTML = resp.data # DEBUG
    
    .finally ()->
      $rootScope.updatingItems = false
      for id, item of ajaxQueue
        delete ajaxQueue[id]
        return ajaxUpdate item
  
  
  # PUBLIC API ####################################################################################
  
  
  return WholesaleOrder =
    
    initItems: (orderItems)->
      for orderItem in orderItems
        previewItem = createPreviewItemFromOrderItem orderItem
        $rootScope.previewItems[previewItem.build_id] = previewItem
      render()
    
    update: (editorBuild)->
      if not $rootScope.updatingItems
        ajaxUpdate editorBuild
      else
        ajaxQueue[editorBuild.build_id] = editorBuild
