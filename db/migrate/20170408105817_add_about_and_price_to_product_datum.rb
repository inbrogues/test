class AddAboutAndPriceToProductDatum < ActiveRecord::Migration
  def change
    add_column :product_data, :price, :float
    add_column :product_data, :about, :text
  end
end
