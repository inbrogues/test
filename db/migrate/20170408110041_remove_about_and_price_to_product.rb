class RemoveAboutAndPriceToProduct < ActiveRecord::Migration
  def change
    remove_column :products, :price, :string
    remove_column :products, :about, :string
  end
end
