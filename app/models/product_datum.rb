class ProductDatum < ActiveRecord::Base
  belongs_to :color
  belongs_to :size
  belongs_to :product
  has_and_belongs_to_many :photos
   accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
end
