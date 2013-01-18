class OrderMailer < ActionMailer::Base
  default from: "from@example.com"
  def order_email(customer, products, total_cost)
    @products = products
    @total_cost = total_cost
    mail(:to => customer.email, :subject => "Potwierdzenie zlozenia zamowienia w sklepie Feminity")
  end
end
