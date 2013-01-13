class @Gui
  constructor: ->
    @fields = []
  
  getTemplate: (templateClass) ->
    return Handlebars.compile($(templateClass).html())

  showCategories: =>
    template = @getTemplate("#category-list-template")
    for c in useCase.categories
      $("#categories-nav").append(template(c))

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

  showAlert: (notice_text) =>
    template = @getTemplate("#alert-template")
    $("#alert").empty()
    $("#alert").html(template(notice_text))

