class Product < ActiveRecord::Base
	has_attached_file :img, styles: { original: "444x666>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
	has_attached_file :img_alt, styles: { original: "444x666>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
    has_many :product_datum
    accepts_nested_attributes_for :product_datum, reject_if: :all_blank, allow_destroy: true
    has_many :color, through: :product_datum
    has_and_belongs_to_many :photos
    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories
end
