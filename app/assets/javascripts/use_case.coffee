class @UseCase
  constructor: ->
    @categories = []
    @products = []
    @search_results = []
    @address = []
    @special_offers = []
    @discounts = []
    @cart = []
    @recently_added = []
  
  showCategories: ->
  showCategory: (id) ->

  showSpecialOffers: ->
  
  showProducts: ->
  showProduct: (id) ->
  setupProducts: ->

  showCart: ->
  confirmCart: ->

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

  getFieldText: (fieldId) ->
    return $("#"+fieldId).val()
  confirmDataForm: ->
    fieldIds = ['name', 'surname', 'email', 'phone', 'street', 'house_nr', 'postal_code', 'city']
    @address = {}
    for field in fieldIds
      @address[field] = @getFieldText('confirmation-'+field)
    @address['newsletter'] = $("#confirmation-newsletter").is(":checked") ? true : false
    console.log(@address)

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

  setupSpecialOffers: ->
    console.log("discounts: " + @discounts)
    for discount in @discounts
      product = @findProduct(discount.product_id)
      product.price *= (100-discount.percentage)/100
      @special_offers.push product


