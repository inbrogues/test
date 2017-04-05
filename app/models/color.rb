class Color < ActiveRecord::Base
  belongs_to :main_color
  has_many :product_datums
  has_attached_file :img, styles: { original: "60x60>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
