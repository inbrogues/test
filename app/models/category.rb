class Category < ActiveRecord::Base
  belongs_to :category, class_name: "Category" 
  has_and_belongs_to_many :products
  alias_attribute :parent, :category
end
