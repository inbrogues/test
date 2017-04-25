class AddHexToMainColor < ActiveRecord::Migration
  def change
  	add_column :main_colors, :hex, :string
  end
end
