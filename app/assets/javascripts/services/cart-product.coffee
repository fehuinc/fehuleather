angular.module "CartProduct", []

.service "CartProduct", ()->
  return (product)->
    cartProduct =
      name: product.name
      choiceName: product.name
      quantity: product.quantity
      image: product.totem
      cents: product.cents_retail
      choices: []
    
    for variation in product.variations
      cartProduct.cents += variation.choice.cents_retail
      cartProduct.choiceName = variation.choice.name + " " + cartProduct.choiceName
      cartProduct.choices.push choice =
        name: variation.choice.name
        id: variation.choice.id
    
    return cartProduct
