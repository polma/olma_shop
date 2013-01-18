class @Gui
  constructor: ->
    @fields = []
  
  getTemplate: (templateClass) ->
    return Handlebars.compile($(templateClass).html())

  showCategories: =>
    $("#categories-nav").append('<li>
      <a href="#" onClick="useCase.showSpecialOffers()"><i>Promocje</i></a></li>')
    $("#categories-nav").append('<li>
      <a href="#" onClick="useCase.showMain()"><i>Nowości</i></a></li>')
    template = @getTemplate("#category-list-template")
    for c in useCase.categories
      $("#categories-nav").append(template(c))

  showSpecialOffers: ->
    $("#main-content").empty()
    template = @getTemplate("#products-list-template")
    for p in useCase.special_offers
      $("#main-content").append(template(p))

  showCategory: (id) ->
    $("#main-content").empty()
    template = @getTemplate("#products-list-template")
    for p in useCase.findProductsForCategory(id)
      $("#main-content").append(template(p))

  showProduct: (id) ->
    $("#main-content").empty()
    template = @getTemplate("#product-template")
    p = useCase.findProduct(id)
    p.price /= 100.0
    $("#main-content").html(template(p))
    p.price *= 100.0

  showCart: ->
    $("#main-content").html("<h2>Zawartość Twojego koszyka</h2>")
    template = @getTemplate("#cart-list-template")
    if useCase.cart.length == 0
      @showAlert("Twój koszyk jest pusty.")
      return
    for p in useCase.cart
      $("#main-content").append(template(p))
    $("#main-content").append('<div class="span3" style="margin-top:20px"><button class="btn btn-success" onClick="useCase.confirmCart()">Potwierdź zamówienie</button></div>')


  showCartMin: ->
    cart_container = $("#cart-container")
    if useCase.cart.length == 0
      cart_container.html("")
      return
    template = @getTemplate("#cart-min-template")
    cart_container.html(template(useCase.cartSum()))

  showConfirmationForm: ->
    template = @getTemplate("#confirmation-form-template")
    $("#main-content").html(template)
    fieldIds = ['name', 'surname', 'email', 'phone', 'street', 'house_nr', 'postal_code', 'city']
    $("#confirmation-"+field).val($.cookie(field)) for field in fieldIds
    $("#confirmation-newsletter").prop("checked", $.cookie("newsletter"))

  showCartConfirmed: ->
    $("#main-content").empty()
    @showAlert("Zamówienie zostało przyjęte!")

  showSearchResults: ->
    $("#main-content").empty()
    template = @getTemplate("#products-list-template")
    for p in useCase.search_results
      $("#main-content").append(template(p))

  showContact: =>
    $("#main-content").html("<h2>Kontakt do nas</h2>")
  showTerms: =>
    $("#main-content").html("<h2>Regulamin sklepu</h2>")
  showMain: =>   
    $("#main-content").empty()
    $("#main-content").html("<h2>Ostatnio dodane produkty</h2>")
    template = @getTemplate("#products-list-template")
    $("#main-content").append(template(useCase.findProduct(id))) for id in useCase.recently_added

  showAlert: (notice_text) =>
    template = @getTemplate("#alert-template")
    $("#alert").empty()
    $("#alert").html(template(notice_text))
    $("#alert").hide(5000)

