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

  showCart: ->
  cartSum: =>
    sum = 0.0
    for p in @cart
      sum += p.price
    sum /= 100.0
    return sum

  showContact: ->
  showTerms: ->
  showMain: ->

  addProductToCart: (id) ->
    @cart.push @findProduct(id)
  deleteProductFromCart: (id) ->
    @cart.splice($.inArray(@findProduct(id), @cart), 1)

  searchForProducts: (text) ->
    if text==''
      @search_results = []
    else
      regexp = new RegExp(text, "i")
      @search_results = @products.filter (p) -> (p.name.search(regexp) != -1 or p.description.search(regexp) != -1)

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
