class Product < ActiveRecord::Base
	has_attached_file :img, styles: { original: "444x666>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
	has_attached_file :img_alt, styles: { original: "444x666>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
    has_many :product_datum
    has_many :color, through: :product_datum
    has_and_belongs_to_many :photos
end
