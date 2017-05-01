class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name , null: false, default: ''
      t.float :price , null: false, default: 0
      t.text :about  , null: false, default: ''

      t.timestamps null: false
    end
  end
end
