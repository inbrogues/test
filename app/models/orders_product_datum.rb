class OrdersProductDatum < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_datum
  belongs_to :product_size
end
