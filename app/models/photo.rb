class Photo < ActiveRecord::Base
	has_attached_file :img, styles: { original: "444x666>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
	has_and_belongs_to_many :product_datum

end
