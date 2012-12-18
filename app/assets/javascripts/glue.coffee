class @Glue
  constructor: (@useCase, @gui, @serverStorage) ->
    
    #showing categories
    Before(@useCase, 'showCategories', => @serverStorage.downloadCategories())
    After(@serverStorage, 'saveCategories', => @gui.showCategories())
    After(@useCase, 'showCategory', (id) => @gui.showCategory(id))

    #showing contact and terms of use
    After(@useCase, 'showContact', => @gui.showContact())
    After(@useCase, 'showTerms', => @gui.showTerms())
    After(@useCase, 'showMain', => @gui.showMain())
