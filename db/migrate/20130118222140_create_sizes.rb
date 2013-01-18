class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
