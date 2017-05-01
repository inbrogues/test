class AddSumToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :sum, :float , default: 0
  end
end
