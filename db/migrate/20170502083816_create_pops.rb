class CreatePops < ActiveRecord::Migration
  def change
    create_table :pops do |t|
      t.text :text
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
