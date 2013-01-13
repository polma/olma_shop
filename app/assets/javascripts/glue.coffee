class @Glue
  constructor: (@useCase, @gui, @serverStorage) ->
    
    #showing categories
    Before(@useCase, 'showCategories', => @serverStorage.downloadCategories())
    After(@serverStorage, 'saveCategories', => @gui.showCategories())
    After(@useCase, 'showCategory', (id) => @gui.showCategory(id))

    #downloading products
    Before(@useCase, 'showProducts', => @serverStorage.downloadProducts())

    #showing a single product
    After(@useCase, 'showProduct', (id) => @gui.showProduct(id))
   
    #searching
    After(@useCase, 'searchForProducts', => @gui.showSearchResults())

    #showing cart
    After(@useCase, 'showCart', => @gui.showCart())
    After(@useCase, 'addProductToCart', (id) => @gui.showCartMin())
    After(@useCase, 'deleteProductFromCart', (id) => @gui.showCartMin())
    After(@useCase, 'deleteProductFromCart', (id) => @gui.showCart())

    #showing contact and terms of use
    After(@useCase, 'showContact', => @gui.showContact())
    After(@useCase, 'showTerms', => @gui.showTerms())
    After(@useCase, 'showMain', => @gui.showMain())
