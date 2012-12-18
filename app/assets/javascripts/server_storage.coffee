class @ServerStorage
  constructor: ->

  saveCategories: (json_table) =>
    #useCase.categories = json_table.map (category) -> new Category(category.id, category.name)
    #for testing only
    useCase.categories = [new Category(1, "Płaszcze"), new Category(2, "Kurtki"), new Category(3, "Szale")]
  
  downloadCategories: =>
    #$.getJSON "TODO", (data, status) => @saveCategories(data)
    #for testing only
    @saveCategories("")

  saveProducts: (json_table) =>
    useCase.products = json_table.map (product) -> new Product(product.id, product.name, product.description, product.price, product.category_id)
  
  downloadProducts: =>
    $.getJSON "TODO", (data, status) => @saveProducts(data)
    
  downloadCart: =>
    $.getJSON "TODO", (data, status) => @saveCart(data)
  
  saveCart: (json_table) =>
    #TODO

  confirmCart: =>
    #TODO
