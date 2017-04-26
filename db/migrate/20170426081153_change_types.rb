class ChangeTypes < ActiveRecord::Migration
  def change
  	change_column :addresses, :post_index, :string
  	change_column :product_data, :article, :string
  end
end
