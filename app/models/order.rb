class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orders_product_data
  attr_accessor :json
  belongs_to :address_ref , class_name: "Address" , foreign_key: "address_id"
  accepts_nested_attributes_for :address_ref
end
