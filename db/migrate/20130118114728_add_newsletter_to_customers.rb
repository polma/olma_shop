class AddNewsletterToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :newsletter, :boolean
  end
end
