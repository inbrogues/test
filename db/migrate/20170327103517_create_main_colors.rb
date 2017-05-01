class CreateMainColors < ActiveRecord::Migration
  def change
    create_table :main_colors do |t|
      t.string :name, null: false, default: ''
    end
  end
end
