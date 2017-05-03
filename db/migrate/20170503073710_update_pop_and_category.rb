class UpdatePopAndCategory < ActiveRecord::Migration
  def change
  	add_reference		:categories, :pop, index: true
  	add_column			:baners, :number, :integer , default: 0
  end
end
