class CreateProductData < ActiveRecord::Migration
  def change
    create_table :product_data do |t|
      t.integer :article , null: false, unique: true
      t.references :color, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
