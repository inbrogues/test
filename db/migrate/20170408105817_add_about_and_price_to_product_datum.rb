class AddAboutAndPriceToProductDatum < ActiveRecord::Migration
  def change
    add_column :product_data, :price, :float, null: false, default: 0
    add_column :product_data, :about, :text, null: false, default: ""
  end
end
