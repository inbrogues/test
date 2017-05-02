class AdminController < ApplicationController
  	layout "admin_layout"
	before_action :authenticate_admin!
	def index
	end
	def orders
		@orders=Order.all
	end
	def colors
		@colors=Color.all
	end
	def main_colors
		@main_colors=MainColor.all
	end
	def categories
		@categories= Category.all
	end
	def products
		@products=Product.all
	end
	def sizes
		@sizes=ProductSize.all
	end
	def baners
		@baners=Baner.all
	end
	def pops
		@pops=Pop.all
	end
	def product_new
		@product = Product.new

		@colors = Color.all
		@sizes = ProductSize.all
		@сategories = Category.all
	end

	def product_create
		@product = Product.new(product_params)
	    respond_to do |format|
	      if @product.save
	      	if params[:product][:product_datum_attributes]!=[] && !params[:product][:product_datum_attributes].nil?
		      	params[:product][:product_datum_attributes].each do |k,pd|
					@productDatas = @product.product_datum.build
					@productDatas.article = pd[:article]
					@productDatas.color_id = pd[:color_id]
					@productDatas.about = pd[:about]
					@productDatas.price = pd[:price]
					@productDatas.promotional_price = pd[:promotional_price]
					@productDatas.more = pd[:more]
					if @productDatas.save
						if pd[:photos_attributes]!=[] && ! pd[:photos_attributes].nil?
							pd[:photos_attributes].each do |k,photo|
								@photo=Photo.new(photo.permit(:img))
								if @photo.save
								    @productDatas.photos<<@photo
								end
							end
						end
						if pd[:product_product_sizes_attributes]!=[] and !pd[:product_product_sizes_attributes].nil?
							pd[:product_product_sizes_attributes].each do |k,product_product_size|
								@size=ProductProductSize.new()
								@size.has = product_product_size[:has].to_i==1
								@size.product_size_id = product_product_size[:product_size_id]
								if @size.save
								    @productDatas.product_product_sizes<<@size
								end
							end
						end
				    end
				end
	      	end
			format.html {redirect_to controller:"admin", action:"products", notice: 'Товар успешно создан' }
	        format.json { render :show, status: :created, location: @product }	
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def product_edit
		@product=Product.find(params[:id])

		@colors = Color.all
		@sizes = ProductSize.all
		@сategories = Category.all
	end

	def product_update
		@product=Product.find(params[:id])
	    respond_to do |format|
	      if @product.update(product_params)
	      	if params[:product][:product_datum_attributes]!=[] && !params[:product][:product_datum_attributes].nil?
		      	params[:product][:product_datum_attributes].each do |k,pd|
					if pd[:id]
						@productDatas = ProductDatum.find(pd[:id])
					else
						@productDatas = @product.product_datum.build	
					end
					@productDatas.article = pd[:article]
					@productDatas.color_id = pd[:color_id]
					@productDatas.about = pd[:about]
					@productDatas.price = pd[:price]
					@productDatas.promotional_price = pd[:promotional_price]
					@productDatas.more = pd[:more]
					if @productDatas.save
						if pd[:photos_attributes]!=[] && ! pd[:photos_attributes].nil?
							pd[:photos_attributes].each do |k,photo|
								if photo[:id]
									@photo = Photo.find(photo[:id])
								else
									@photo=Photo.new(photo.permit(:img))
									if @photo.save
									    @productDatas.photos<<@photo
									end
								end
							end
						end
						if pd[:product_product_sizes_attributes]!=[] and !pd[:product_product_sizes_attributes].nil?
							pd[:product_product_sizes_attributes].each do |k,product_product_size|
								@pd_size=ProductProductSize.new()
								if product_product_size[:id]
									@pd_size=ProductProductSize.find(product_product_size[:id])
								end
								@pd_size.has = product_product_size[:has].to_i==1
								@pd_size.product_size_id = product_product_size[:product_size_id]
								puts @pd_size
								puts @productDatas.product_product_sizes
								if !@productDatas.product_product_sizes.include?(@pd_size) 
									if @pd_size.save
									    @pd_size.product_id= @productDatas.id
									    @pd_size.save
									end
								end
							end
						end
				    end
				end
	      	end
			format.html {redirect_to controller:"admin", action:"products", id:  @product.id , notice: 'Товар успешно обновлён' }
	        format.json { render :show, status: :created, location: @product }	
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def product_destroy
		@product=Product.find(params[:id])
		@product.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"products", notice: 'Товар успешно удалён' }
		  format.json { head :no_content }
		end
	end
	def color_new
		@color = Color.new
		@main_color=MainColor.all
	end

	def color_create
		@color = Color.new(color_params)
	    respond_to do |format|
	      if @color.save
	        format.html {redirect_to controller:"admin", action:"colors", id:  @color.id , notice: 'Цвет успешно создан ' }
	        format.json { render :show, status: :created, location: @color }
	      else
	        format.html { render :new }
	        format.json { render json: @color.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def color_edit
		@color = Color.find(params[:id])
		@main_color=MainColor.all
	end

	def color_update
		@color = Color.find(params[:id])
	    respond_to do |format|
	      if @color.update(color_params)
	        format.html {redirect_to controller:"admin", action:"colors", id:  @color.id , notice: 'Цвет успешно обновлён ' }
	        format.json { render :show, status: :created, location: @color }
	      else
	        format.html { render :new }
	        format.json { render json: @color.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def color_destroy
		@color=Color.find(params[:id])
		@color.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"colors", notice: 'Цвет успешно удалён' }
		  format.json { head :no_content }
		end
	end

	def main_color_new
		@main_color = MainColor.new
	end

	def main_color_create
		@main_color = MainColor.new(main_color_params)
	    respond_to do |format|
	      if @main_color.save
	        format.html {redirect_to controller:"admin", action:"main_colors", id:  @main_color.id , notice: 'Группа цветов успешно создана ' }
	        format.json { render :show, status: :created, location: @main_color }
	      else
	        format.html { render :new }
	        format.json { render json: @main_color.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def main_color_edit
		@main_color = MainColor.find(params[:id])
	end

	def main_color_update
		@main_color = MainColor.find(params[:id])
	    respond_to do |format|
	      if @main_color.update(main_color_params)
	        format.html {redirect_to controller:"admin", action:"main_colors", id:  @main_color.id , notice: 'Группа цветов успешно обновлёна ' }
	        format.json { render :show, status: :created, location: @main_color }
	      else
	        format.html { render :new }
	        format.json { render json: @main_color.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def main_color_destroy
		@main_color=MainColor.find(params[:id])
		@main_color.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"main_colors", notice: 'Группа цветов успешно удалён ' }
		  format.json { head :no_content }
		end
	end

	def category_create
		@category = Category.new(category_params)
	    respond_to do |format|
	      if @category.save
	        format.html {redirect_to controller:"admin", action:"categories", id:  @category.id , notice: 'Категория успешн создана' }
	        format.json { render :show, status: :created, location: @category }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def category_edit
		@category=Category.find(params[:id])
	end
	def category_update
		@category = Category.find(params[:id])
	    respond_to do |format|
	      if @category.update(category_params)
	        format.html {redirect_to controller:"admin", action:"categories", id:  @category.id , notice: 'Категория успешно обновлена' }
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
	def category_destroy
		@category=Category.find(params[:id])
		@category.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"categories", notice: 'Категория успешно удалена' }
		  format.json { head :no_content }
		end
	end
	def size_new
		@size=ProductSize.new
	end
	def size_create
		@size=ProductSize.new(product_size_params)
	    respond_to do |format|
	      if @size.save
	        format.html {redirect_to controller:"admin", action:"sizes", id:  @size.id , notice: 'Размер был успешно создан' }
	        format.json { render :show, status: :created, location: @size }
	      else
	        format.html { render :new }
	        format.json { render json: @size.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def size_edit
		@size=ProductSize.find(params[:id])
	end
	def size_update
		@size=ProductSize.find(params[:id])
	    respond_to do |format|
	      if @size.update(product_size_params)
	        format.html {redirect_to controller:"admin", action:"sizes", id:  @size.id , notice: 'Размер был успешно обновлён' }
	        format.json { render :show, status: :created, location: @size }
	      else
	        format.html { render :edit }
	        format.json { render json: @size.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def size_destroy
		@size=ProductSize.find(params[:id])
		@size.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"sizes", notice: 'Размер был успешно удалён' }
		  format.json { head :no_content }
		end
	end

	def baner_new
		@baner=Baner.new
	end
	def baner_create
		@baner=Baner.new(baner_params)
	    respond_to do |format|
	      if @baner.save
	        format.html {redirect_to controller:"admin", action:"baners", id:  @baner.id , notice: 'Банер был успешно создан' }
	        format.json { render :show, status: :created, location: @baner }
	      else
	        format.html { render :new }
	        format.json { render json: @baner.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def baner_edit
		@baner=Baner.find(params[:id])
	end
	def baner_update
		@baner=Baner.find(params[:id])
	    respond_to do |format|
	      if @baner.update(baner_params)
	        format.html {redirect_to controller:"admin", action:"baners", id:  @baner.id , notice: 'Банер был успешно обновлён' }
	        format.json { render :show, status: :created, location: @baner }
	      else
	        format.html { render :edit }
	        format.json { render json: @baner.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def baner_destroy
		@baner=Baner.find(params[:id])
		@baner.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"baners", notice: 'Банер был успешно удалён' }
		  format.json { head :no_content }
		end
	end

	def pop_new
		@pop=Pop.new
	end
	def pop_create
		@pop=Pop.new(pop_params)
	    respond_to do |format|
	      if @pop.save
	        format.html {redirect_to controller:"admin", action:"pops", id:  @pop.id , notice: 'Банер был успешно создан' }
	        format.json { render :show, status: :created, location: @pop }
	      else
	        format.html { render :new }
	        format.json { render json: @pop.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def pop_edit
		@pop=Pop.find(params[:id])
	end
	def pop_update
		@pop=Pop.find(params[:id])
	    respond_to do |format|
	      if @pop.update(pop_params)
	        format.html {redirect_to controller:"admin", action:"pops", id:  @pop.id , notice: 'Банер был успешно обновлён' }
	        format.json { render :show, status: :created, location: @pop }
	      else
	        format.html { render :edit }
	        format.json { render json: @pop.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def pop_destroy
		@pop=Pop.find(params[:id])
		@pop.destroy
		respond_to do |format|
		  format.html { redirect_to controller:"admin", action:"sizes", notice: 'Банер был успешно удалён' }
		  format.json { head :no_content }
		end
	end
	def order_edit
		@order=Order.find(params[:id])
	end

	def order_update
		@order=Order.find(params[:id])
		@user=@order.user
		@user.money=(@user.money||0) - @order.cash_back
	    respond_to do |format|
	      if @order.update(order_params)
	      	@user.money+=@order.cash_back
	      	@user.save
	        format.html {redirect_to controller:"admin", action:"orders", id:  @order.id , notice: 'Заказ был успешно обновлён' }
	        format.json { render :show, status: :created, location: @order }
	      else
	        format.html { render :edit }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def order_destroy
		@order=Order.find(params[:id])
		@order.destroy
	end
	def product_params
      params.require(:product).permit(:name , :img , :img_alt)
    end
    def color_params
      params.require(:color).permit(:name , :main_color_id , :img )
    end
    def main_color_params
      params.require(:main_color).permit(:name , :hex)
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
   	def order_params
   		params.require(:order).permit(:status , :cash_back )
   	end
   	def baner_params
   		params.require(:baner).permit(:text , :photo_id)
   	end
   	def pop_params
   		params.require(:baner).permit(:text , :category_id)
   	end
end
