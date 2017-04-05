class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :about

      t.timestamps null: false
    end
  end
end
