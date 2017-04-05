class AddSizeToProductProductSize < ActiveRecord::Migration
  def change
    add_column :product_product_sizes, :size, :string
  end
end
