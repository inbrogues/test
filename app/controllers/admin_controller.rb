class AdminController < ApplicationController
	def product_new
		@product = Product.new

		@colors = Color.all
		@sizes = ProductSize.all
		@сategories = Category.all
	end
	def edit
	end

	def create
		@product = Product.new()
		@product.name = params[:product][:name]
		@product.price = params[:product][:price]
		@product.about = params[:product][:about]

		puts params
	    respond_to do |format|
	      if @product.save
			@productDatas = @product.product_datum.build
			@productDatas.article = params[:product][:product_datum][:article]
			@productDatas.color_id = params[:product][:product_datum][:color_id]
			if @productDatas.save
		        format.html {redirect_to controller:"products", action:"single", id:  @product.id , notice: 'Color was successfully created.' }
		        format.json { render :show, status: :created, location: @product }
		    else
		        format.html { render :new }
		        format.json { render json: @product.errors, status: :unprocessable_entity }
		    end

	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update
	    respond_to do |format|
	      if @product.update(product_params)
	        format.html { redirect_to  action:"single", id:  @product.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @product }
	      else
	        format.html { render :edit }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def product_params
      params.require(:product).permit(:img , :img_alt)
    end
end
