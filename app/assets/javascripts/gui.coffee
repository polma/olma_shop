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
    $("#content-h2").empty()
    template = @getTemplate("#products-list-template")
    for p in useCase.findProductsForCategory(id)
      $("#content-h2").append(template(p))

  showContact: =>
    $("#content-h2").html("Kontakt do nas")
  showTerms: =>
    $("#content-h2").html("Regulamin sklepu")
  showMain: =>
    $("#content-h2").empty()

  showAlert: (notice_text) =>
    template = @getTemplate("#alert-template")
    $("#alert").empty()
    $("#alert").html(template(notice_text))

