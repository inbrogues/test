class AddMoreToProductData < ActiveRecord::Migration
  def change
    add_column :product_data, :more, :string, null: false, default: ''
  end
end
