class @ServerStorage
  constructor: ->
  
  saveCategories: (json_table) =>
    useCase.categories = json_table.map (category) -> new Category(category.id, category.name)
  
  downloadCategories: =>
    $.getJSON "/categories.json", (data, status) => @saveCategories(data)

  saveDiscounts: (json_table) =>
    useCase.discounts = json_table.map (discount) -> new Discount(discount.product_id, discount.percentage)
  
  downloadDiscounts: =>
    $.getJSON "/discounts.json", (data, status) => @saveDiscounts(data)
  
  saveProducts: (json_table) =>
    console.log(json_table)
    useCase.products = json_table.map (product) -> new Product(product.id, product.name, product.description, product.price, product.category_id, product.sizes)
  
  downloadProducts: =>
    $.getJSON "/products.json", (data, status) => @saveProducts(data)
  
  saveRecentlyAdded: (json_table) =>
    useCase.recently_added = json_table.map (product) -> product.id
    console.log(useCase.recently_added)
  
  downloadRecentlyAdded: =>
    $.getJSON "/recently_added.json", (data, status) => @saveRecentlyAdded(data)

  saveCart: (json_table) =>
    useCase.cart = json_table.map (product) -> new Product(product.id, product.name, product.description, product.price, product.category_id)
  downloadCart: =>
    $.getJSON "/cart.json", (data, status) => @saveCart(data)
 
  addProductToCart: (id) =>
   $.post("/cart/add/"+id, -> console.log("success"))
  deleteProductFromCart: (id) =>
   $.post("/cart/del/"+id, -> console.log("success"))

  confirmCart: =>
    $.post("/cart/confirm", {address: useCase.address})
    @downloadCart()
