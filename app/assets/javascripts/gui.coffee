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
    @showAlert('Wybrałeś kategorię: ' + id)
    $("#content-h2").html(id)

  showAlert: (notice_text) =>
    template = @getTemplate("#alert-template")
    $("#alert").empty()
    $("#alert").html(template(notice_text))

