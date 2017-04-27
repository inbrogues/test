class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orders_product_data
  attr_accessor :json
end
