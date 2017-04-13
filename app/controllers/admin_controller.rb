class AdminController < ApplicationController
	def index
	end
	def colors
		@colors=Color.all
	end
	def categories
		@categories= Category.all
	end
	def product_sizes
		@products=Product.all
	end

	def sizes
		@sizes=ProductSize.all
	end
	def product_new
		@product = Product.new

		@colors = Color.all
		@sizes = ProductSize.all
		@сategories = Category.all
	end

	def product_create
		@product = Product.new(product_params)
		puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
		puts params
		puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	    respond_to do |format|
	      if @product.save
	      	params[:product][:product_datum_attributes].each do |k,pd|
				@productDatas = @product.product_datum.build
				@productDatas.article = pd[:article]
				@productDatas.color_id = pd[:color_id]
				@productDatas.about = pd[:about]
				@productDatas.price = pd[:price]
				if @productDatas.save
					pd[:photos_attributes].each do |k,photo|
						@photo=Photo.new(photo.permit(:img))
						if @photo.save
						    @productDatas.photos<<@photo
						end
					end
					pd[:product_product_sizes_attributes].each do |k,product_product_size|
						@size=ProductProductSize.new()
						@size.has = product_product_size[:has].to_i==1
						@size.product_size_id = product_product_size[:product_size_id]
						if @size.save
						    @productDatas. product_product_sizes<<@size
						end
					end

		        format.html {redirect_to controller:"products", action:"single", id:  @product.id , notice: 'Color was successfully created.' }
		        format.json { render :show, status: :created, location: @product }

			    else
			        format.html { render :new }
			        format.json { render json: @product.errors, status: :unprocessable_entity }
			    end
			end
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def color_new
		@color = Color.new
	end

	def color_create
		@color = Color.new(color_params)
		puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n"
		puts params
		puts "\n-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	    respond_to do |format|
	      if @color.save
	        format.html {redirect_to controller:"admin", action:"index", id:  @color.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @color }
	      else
	        format.html { render :new }
	        format.json { render json: @color.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def category_create
		@category = Category.new(category_params)
		puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n"
		puts params
		puts "\n-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	    respond_to do |format|
	      if @category.save
	        format.html {redirect_to controller:"admin", action:"index", id:  @category.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @category }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def category_new
		@category=Category.new
	end

	def size_new
		@size=ProductSize.new
	end
	def size_create
		@size=ProductSize.new(product_size_params)
		puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n"
		puts params
		puts "\n-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	    respond_to do |format|
	      if @size.save
	        format.html {redirect_to controller:"admin", action:"index", id:  @size.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @size }
	      else
	        format.html { render :new }
	        format.json { render json: @size.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def product_params
      params.require(:product).permit(:img , :img_alt)
    end
    def color_params
      params.require(:color).permit(:name , :main_color_id , :img )
    end
    def category_params
      params.require(:category).permit(:name ,:parent_id)
    end
    def photo_params
   		params.require(:photo).permit(:img)
   	end
   	def product_size_params
   		params.require(:product_size).permit(:size)
   	end
end
