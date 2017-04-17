class AddPromotionalPriceToProductDatum < ActiveRecord::Migration
  def change
    add_column :product_data, :promotional_price, :float
  end
end
