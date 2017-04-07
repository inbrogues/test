class PhotoProductData < ActiveRecord::Migration
  def change
  		create_table :photos_product_data, id: false do |t|
		    t.belongs_to :photo, index: true
		    t.belongs_to :product_datum, index: true
		end
  end
end
