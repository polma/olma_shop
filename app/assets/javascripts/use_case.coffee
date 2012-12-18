class @UseCase
  constructor: ->
    @categories = []
    @products = []
    @search_results = []
    @cart = []
  
  showCategories: ->
  showCategory: (id) ->
  showProduct: (id) ->

  addProductToCart: (id) ->
  searchForProducts: () ->

  findProduct: (id) ->
    for p in @products
      if p.id == id
        return p
  findCategory: (id) ->
    for c in @categories
      if c.id == id
        return c
  findProductsForCategory: (id) ->
    return @products.filter (p) -> p.category_id == id
