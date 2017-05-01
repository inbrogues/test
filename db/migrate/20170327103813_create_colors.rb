class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name , null: false, default: ''
      t.references :main_color, index: true, foreign_key: true
    end
  end
end
