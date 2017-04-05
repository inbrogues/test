class Category < ActiveRecord::Base
  belongs_to :parent , as: :category 
end
