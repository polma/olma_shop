class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :street
      t.string :house_nr
      t.string :city
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
