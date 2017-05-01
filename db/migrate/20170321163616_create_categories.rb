class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name , null: false, default: ''
      t.references :category, index: true
    end
  end
end
