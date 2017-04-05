class AddImgColumnsToColor < ActiveRecord::Migration
  def up
    add_attachment :colors, :img
  end

  def down
    remove_attachment :colors, :img
  end
end
