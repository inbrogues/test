class Category < ActiveRecord::Base
  belongs_to :parent, class_name: "Category" 
  has_and_belongs_to_many :products
end
