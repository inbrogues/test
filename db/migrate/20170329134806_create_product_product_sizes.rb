class CreateProductProductSizes < ActiveRecord::Migration
  def change
    create_table :product_product_sizes do |t|
      t.boolean :has
      t.references :product_datum, index: true, foreign_key: true , column: :product_id
      t.references :product_size, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
