class ProductsController < ApplicationController
	include ProductsHelper
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
		@products=Product.where(id: 
			CategoriesProducts.where(category_id: 
				CategoriesProducts.where(product_id: @product.id
					).collect(&:category_id)
				).collect(&:product_id)
			).limit(6)
		.order("RANDOM()")
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
		@ChoizenSize = params[:sizes]||[]
		@Sort = params[:sort]
		if @cat
			@productsCat=Product.where(id: 
				CategoriesProducts.where(category_id: 
					@cat_for_product
				).collect(&:product_id)
			)

		else
			@productsCat=Product.all
		end

		@productsAll=@productsCat			

		if @ChoizenColor!=[]
			@productsAll=@productsAll.where(id:
				ProductDatum.where(color_id:
					Color.where(main_color_id: 
						MainColor.where(name: @ChoizenColor)
					).collect(&:id)
				).collect(&:product_id)
			)
			else
		end

		if @ChoizenSize!=[]
			@productsAll=@productsAll.where(id: 
				ProductDatum.where(id: 
					ProductProductSize.where(product_size_id: 
						ProductSize.where(size: @ChoizenSize) , has:true
					).collect(&:product_id)
				).collect(&:product_id)
			)		
		end
		puts "-------------------------------------------------------------------------------------------------"
		puts @Sort
		if @Sort
			if @Sort == "PriceAsc"
				puts 1
				@productsAll = @productsAll.sort_by{|p| (p.product_datum[0]||{price: 0})[:price]||0}
			elsif @Sort == "PriceDesc"
				puts 2
				@productsAll = @productsAll.sort_by{|p| ((p.product_datum[0]||{price: 0})[:price]||0)*-1}
			end 
		end
		@PossibleSizes=ProductSize.where(id: 
			ProductProductSize.where(product_id: 
				ProductDatum.where(product_id: 
					@productsCat.collect(&:id)
				).collect(&:id), has:true
			).collect(&:product_size_id)
		)
	
		
		@PossibleColors=MainColor.where(id: 
			Color.where(id: 
				ProductDatum.where(product_id: 
					@productsCat.collect(&:id)
				).collect(&:color_id)
			).collect(&:main_color_id)
		)

		@products=@productsAll[0..8]
		@products_all=@productsAll.count
		@products = @productsAll.paginate(:page => params[:page], :per_page => 30)	
	end
	def search




		@search = params[:search]||""
		#color
		@res=[]
		@res+=ProductDatum.where(color_id: 
			Color.where("name LIKE ?", "%#{@search}%")
			.collect(&:id)
		).collect(&:product_id)
		
		#имя 
		@res+=Product.where("name LIKE ?", "%#{@search}%").collect(&:id)


		#артикл
		@res+=ProductDatum.where("article LIKE ?", "%#{@search}%").collect(&:product_id)

		#размер
		@res+=ProductDatum.where(id: 
			ProductProductSize.where(product_size_id: 
				ProductSize.where("size LIKE ?", "%#{@search}%")
				.collect(&:id)
			).collect(&:product_id)
		).collect(&:product_id)		
		#Категории
		@res+=CategoriesProducts.where(category_id: 
			Category.where("name LIKE ?", "%#{@search}%")
			.collect(&:id)
		).collect(&:id)

		
		@res=@res.each_with_object( {} ) {|e, h| h[e] ||= 0; h[e] += 1 }.sort_by {|o, ct| [-ct, o] }

		@ids=[]

		@res.each{|k| @ids<<k[0]}

		@productsAll=Product.where(id: @ids)


		@ChoizenColor = params[:colorWithNames]||[]
		@ChoizenSize = params[:sizes]||[]



		@PossibleSizes=ProductSize.where(id: 
			ProductProductSize.where(product_id: 
				ProductDatum.where(product_id: 
					@productsAll.collect(&:id)
				).collect(&:id), has:true
			).collect(&:product_size_id)
		)
	
		
		@PossibleColors=MainColor.where(id: 
			Color.where(id: 
				ProductDatum.where(product_id: 
					@productsAll.collect(&:id)
				).collect(&:color_id)
			).collect(&:main_color_id)
		)
		@products=@productsAll.paginate(:page => params[:page], :per_page => 30)
	end

	def favourites
	end
	
	def test
	  respond_to do |format|
	  	product_datum = ProductDatum.find(params[:id])
	    product=product_datum.product
	    color=product_datum.color
	    photo=product_datum.photos.first
	    sizes = ProductSize.where( id: product_datum.product_product_sizes.where(has: true).collect(&:product_size_id)).collect{|d| {id: d.id,size: d.size}}

	    msg = { 
	    	:status => "ok",
	    	:message => "Success!",
	    	:html => "<b>...</b>",
	    	:name => product.name ,
	    	:src => photo.img(:original),
	    	:price => product_datum.price,
	    	:promotional_price => product_datum.promotional_price ,
	    	:article => product_datum.article ,
	    	:color => color.name,
	    	:sizes => sizes
	    }
	    format.json  { render :json => msg }
	  end
	end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:img , :img_alt)
    end

end