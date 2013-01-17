class @Shop
  constructor: ->
    useCase = new UseCase()
    window.useCase = useCase
    serverStorage = new ServerStorage()
    gui = new Gui()
    glue = new Glue(useCase, gui, serverStorage)
    useCase.showCategories()
    useCase.showProducts()
    serverStorage.downloadDiscounts()
    #useCase.setupSpecialOffers()
    serverStorage.downloadCart()

$(-> new Shop())
