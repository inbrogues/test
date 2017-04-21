class CreateOrdersProductData < ActiveRecord::Migration
  def change
    create_table :orders_product_data do |t|
      t.references :order, index: true, foreign_key: true
      t.integer :count
      t.references :product_size, index: true, foreign_key: true
      t.belongs_to :product_datum, index: true
      t.timestamps null: false
    end
  end
end
