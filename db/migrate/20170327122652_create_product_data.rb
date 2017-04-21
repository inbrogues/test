class CreateProductData < ActiveRecord::Migration
  def change
    create_table :product_data do |t|
      t.references :color, index: true, foreign_key: true
      t.integer :article
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
