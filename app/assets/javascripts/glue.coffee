class @Glue
  constructor: (@useCase, @gui, @serverStorage) ->
    
    #showing categories
    Before(@useCase, 'showCategories', => @serverStorage.downloadCategories())
    After(@serverStorage, 'saveCategories', => @gui.showCategories())
    After(@useCase, 'showCategory', (id) => @gui.showCategory(id))
