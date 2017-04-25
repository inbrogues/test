class AddDataToAddress < ActiveRecord::Migration
  def change
	add_column :addresses, :seccond_address, :string
    add_column :addresses, :city, :string
    add_column :addresses, :post_index, :integer
  end
end
