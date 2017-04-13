class ProductsController < ApplicationController
	def single
		@product_data=ProductDatum.find_by(article: params[:article] )
		@product = @product_data.product


		@product_datas = @product.product_datum
		@product_sizes = @product_data.product_product_sizes
		color_id=@product_datas.collect(&:color_id)
		if color_id != [nil]
			@colors = Color.find(color_id)
		else
			@colors = []
		end
		
		@color_active = @product_data.color

		@products=Product.limit(6)

	end
	def index
		@products=Product.limit(9)
		@category=Category.all
		@main_category=@category.select{|e| e.parent==nil}

	end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:img , :img_alt)
    end
end