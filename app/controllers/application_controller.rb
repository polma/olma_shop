class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_customer
  def current_customer
    if cookies[:customer_id].nil? or not Customer.exists?(cookies[:customer_id])
      @current_customer = Customer.create
      cookies[:customer_id] = { :value => @current_customer.id, :expires => 2.weeks.from_now }
    else
      @current_customer = Customer.find(cookies[:customer_id])
    end
    return @current_customer
  end
end
