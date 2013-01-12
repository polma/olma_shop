class @UseCase
  constructor: ->
    @categories = []
    @products = []
    @search_results = []
    @cart = []
  
  showCategories: ->
  showCategory: (id) ->

  showProducts: ->
  showProduct: (id) ->

  showContact: ->
  showTerms: ->
  showMain: ->

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
