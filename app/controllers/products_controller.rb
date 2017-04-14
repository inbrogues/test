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
		
		@category=Category.all
		@main_category=@category.select{|e| e.parent==nil}
		@params_cat=[ params[:categorie0] , params[:categorie1], params[:categorie2] ,params[:categorie3]].compact 
		



		helper=@category
		@cat=nil;
		@cat_active=[]
		@params_cat.each{ |cat_name|
			if helper.find{|e| e.name == cat_name}
				@cat=helper.find{|e| e.name == cat_name}
				helper=@category.select{|e| e.parent==@cat}
				@cat_active<<@cat
			else return
			end
		}
		@cat_for_product=[]
		if @cat
			@cat_for_product<<@cat
			helper=@category.select{|e| e.parent==@cat}
			if helper !=[]
				helper.each do |c0|
					@cat_for_product<<c0
					helper1=@category.select{|e| e.parent==c0}
					if helper1 !=[]
						helper1.each do c1
							@cat_for_product<<c1
							helper2=@category.select{|e| e.parent==c1}
							if helper2 !=[]
								helper2.each do|c2|
									@cat_for_product<<c2
								end
							end
						end
					end
				end
			end
		end


		@ChoizenColor = params[:colorWithNames]||[]

		if @cat

			@productsCat=Product.where(id: 
				CategoriesProducts.where(category_id: 
					@cat_for_product).collect(&:product_id))

		else
			@productsCat=Product.all
		end

		if @ChoizenColor!=[]
			@productsAll=@productsCat.where(id:
				ProductDatum.where(color_id:
					Color.where(main_color_id: 
						MainColor.where(name: @ChoizenColor)
					).collect(&:id)
				).collect(&:product_id)
			)
			else
			@productsAll=@productsCat			
		end

		@products=@productsAll[0..8]
		@products_all=@productsAll.count
		
		

		@PossibleColors=MainColor.where(id: 
			Color.where(id: 
				ProductDatum.where(product_id: 
					@productsAll.collect(&:id)
				).collect(&:color_id)
			).collect(&:main_color_id)
		).collect(&:name) 

	end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:img , :img_alt)
    end

end