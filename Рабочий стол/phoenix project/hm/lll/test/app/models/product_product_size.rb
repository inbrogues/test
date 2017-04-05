class ProductProductSize < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_size
end
