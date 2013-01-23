class @Category
  constructor: (@id, @name) ->

class @Product
  constructor: (@id, @name, @description, @price, @category_id, @sizes) ->

class @Discount
  constructor: (@product_id, @percentage) ->
