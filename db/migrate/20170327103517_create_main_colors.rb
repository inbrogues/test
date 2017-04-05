class CreateMainColors < ActiveRecord::Migration
  def change
    create_table :main_colors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
