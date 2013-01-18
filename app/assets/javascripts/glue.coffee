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

    #special offers
    Before(@useCase, 'setupProducts', => @serverStorage.downloadDiscounts())
    After(@serverStorage, 'saveProducts', => @useCase.setupProducts())
    After(@serverStorage, 'saveDiscounts', => @useCase.setupSpecialOffers())
    After(@useCase, 'setupSpecialOffers', => @gui.showMain())
    After(@useCase, 'showSpecialOffers', => @gui.showSpecialOffers())

    #showing cart
    After(@useCase, 'showCart', => @gui.showCart())
    After(@useCase, 'addProductToCart', (id) => @gui.showCartMin())
    After(@serverStorage, 'saveCart', => @gui.showCartMin())
    After(@useCase, 'addProductToCart', (id) => @serverStorage.addProductToCart(id))
    After(@useCase, 'deleteProductFromCart', (id) => @gui.showCartMin())
    After(@useCase, 'deleteProductFromCart', (id) => @gui.showCart())
    After(@useCase, 'deleteProductFromCart', (id) => @serverStorage.deleteProductFromCart(id))

    #order confirmation form
    #After(@useCase, 'confirmCart', => @serverStorage.downloadAddress())
    After(@useCase, 'confirmCart', => @gui.showConfirmationForm())
    After(@useCase, 'confirmDataForm', => @serverStorage.confirmCart())
    After(@serverStorage, 'confirmCart', => @gui.showCartConfirmed())

    #showing contact and terms of use
    After(@useCase, 'showContact', => @gui.showContact())
    After(@useCase, 'showTerms', => @gui.showTerms())
    After(@useCase, 'showMain', => @gui.showMain())
