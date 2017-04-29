class ProductProductSize < ActiveRecord::Base
  belongs_to :product_datum , foreign_key: "product"
  belongs_to :product_size
  alias_method :product, :product_datum
  alias_attribute :product_id, :product_datum_id
end
