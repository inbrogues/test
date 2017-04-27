class RemoveDatasFromAddress < ActiveRecord::Migration
  def change
  	remove_column :addresses, :seccond_address
  	remove_column :addresses, :address
  end
end
