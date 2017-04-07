class ProductsController < ApplicationController
	before_action :set_product, only: [:single, :edit, :update ,:destroy]
	def single	
		@product_datas = @product.product_datum
		@product_data = @product_datas[0]
		@product_sizes = ProductProductSize.where(product: @product_data).order("has DESC")
		color_id=@product_datas.collect(&:color_id)
		if color_id != [nil]
			@colors = Color.find(color_id)
		else
			@colors = []
		end
		
		@color_active = @product_data.color

		@products=Product.limit(6)

	end

	def new
	    @product = Product.new
		#@product_sizes = ProductProductSize.where(product: @product_data).order("has DESC")
		#product_datas = ProductDatum.where(product: @product)
		#@colors = Color.find(@product_datas.collect(&:color_id))
		#@color_active = Color.find(@product_data)
	end

	  # GET /colors/1/edit
	def edit
	end

	# POST /colors
	# POST /colors.json
	def create
		@product = Product.new(product_params)

	    respond_to do |format|
	      if @product.save
	        format.html {redirect_to  action:"single", id:  @product.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @product }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	  # PATCH/PUT /colors/1
	  # PATCH/PUT /colors/1.json
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

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id]||1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:img , :img_alt)
    end
end