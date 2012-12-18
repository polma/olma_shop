class @Shop
  constructor: ->
    useCase = new UseCase()
    window.useCase = useCase
    serverStorage = new ServerStorage()
    gui = new Gui()
    glue = new Glue(useCase, gui, serverStorage)
    useCase.showCategories()

$(-> new Shop())
