class CreateBaners < ActiveRecord::Migration
  def change
    create_table :baners do |t|
      t.text :text
      t.references :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
