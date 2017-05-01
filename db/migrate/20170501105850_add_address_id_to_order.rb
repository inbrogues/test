class AddAddressIdToOrder < ActiveRecord::Migration
  def change
  	add_reference :orders, :address, index: true , null: false
  end
end
