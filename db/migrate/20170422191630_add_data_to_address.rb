class AddDataToAddress < ActiveRecord::Migration
  def change
	add_column :addresses, :seccond_address, :string, null: false, default: ''
    add_column :addresses, :city, :string, null: false, default: ''
    add_column :addresses, :post_index, :integer, null: false, default: 0
  end
end
