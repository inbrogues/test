class OrdersProductDatum < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_data
  belongs_to :product_size
end
