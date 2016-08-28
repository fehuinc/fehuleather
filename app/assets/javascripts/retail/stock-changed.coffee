Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  for s in FEHU.stocks
    build = CartDB.getBuildById s.id
    if build?
      build.stock = s.stock
      CartDB.setBuild build, build.quantity # This forces it to revalidate the quantity
