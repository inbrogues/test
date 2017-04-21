class AddDatasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :father, :string
    add_column :users, :country, :string
    add_column :users, :date, :date
    add_column :users, :tel, :string
  end
end
