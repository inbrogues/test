class AddCashBackToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :cash_back, :float , default: 0
  end
end
