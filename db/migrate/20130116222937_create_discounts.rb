class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :product_id
      t.integer :percentage
      t.boolean :active

      t.timestamps
    end
  end
end
