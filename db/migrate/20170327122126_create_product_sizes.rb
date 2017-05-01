class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.references :category, index: true, foreign_key: true
      t.string :size , null: false, default: ''
    end
  end
end
