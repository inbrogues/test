class AddMoreToProductData < ActiveRecord::Migration
  def change
    add_column :product_data, :more, :string
  end
end
