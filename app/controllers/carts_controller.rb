class CartsController < ApplicationController

  def get_customers_cart
    Order.where("customer_id = ? AND confirmed = false", @customer.id).first
  end

  def show
    @customer = current_customer
    @cart = get_customers_cart
    cart_items = []
    if not @cart.nil?
      @cart.order_items.each do |i|
        cart_items << i.product
      end
    end

    respond_to do |t|
      t.json { render :json => cart_items }
    end
  end
  def add
    @customer = current_customer
    @cart = get_customers_cart
    if @cart.nil?
      @cart = Order.create({:customer_id => @customer.id, :confirmed => false, :sent => false})
    end
    product = Product.find(params[:id])
    if not product.nil?
      OrderItem.create({:order_id => @cart.id, :product_id => params[:id]})
    end
    respond_to do |t|
      t.json { render :json => "Product added succesfully" }
    end
  end
  def confirm
    @customer = current_customer
    @cart = get_customers_cart

    if @cart.nil?
      return
    end

    @cart.confirmed = true
    @cart.custom_shipping_address = false
    @cart.save

    address = params['address'] 
    fieldIds = ['name', 'surname', 'email', 'phone', 'street', 'house_nr', 'postal_code', 'city']
    
    fieldIds.each do |f|
      @customer[f] = address[f]
    end

    @customer.save
    
    respond_to do |t|
      t.json { render :json => @customer }
    end
  end
end
