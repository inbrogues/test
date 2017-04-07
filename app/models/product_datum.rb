class ProductDatum < ActiveRecord::Base
  belongs_to :color
  belongs_to :size
  belongs_to :product
  has_and_belongs_to_many :photos
end
