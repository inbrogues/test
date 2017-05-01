class ChangeTypes < ActiveRecord::Migration
  def change
  	change_column :addresses, :post_index, :string, null: false, default: ''
  	change_column :product_data, :article, :string, null: false, unique: true
  end
end
