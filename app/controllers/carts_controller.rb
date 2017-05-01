class CartsController < ApplicationController
	before_action :authenticate_user! , :only => [:create_order, :diver , :order ]
	def order_create
		@order=Order.new(order_params)
		puts order_params[:address]
		@order.user=current_user
		data = JSON.parse order_params[:json]
	    
		@order.status = 'В обработке'
	    respond_to do |format|
	      if @order.save
	      	@order.sum=0
	      	data.each { |d|
	      		a=OrdersProductDatum.new
	      		a.order_id=@order.id
	      		a.count=d['count']
	      		a.product_datum_id=d['id']
	      		a.product_size=ProductSize.find_by(size: d['size'])
	      		pd = ProductDatum.find(d['id'])
	      		@order.sum += pd.promotional_price||pd.price
	      		a.save
	      	}
	      	@address = Address.where(user: current_user)[0]||Address.new
	      	
	      	@order.address_ref = @address
	      	@address.city=order_address_params["city"]
	      	@address.post_index=order_address_params["post_index"]
	      	@address.user=@order.user
	      	@address.save
	      	@order.address=@address.city+" "+@address.post_index
	      	@order.save

	        format.html {redirect_to controller:"carts", action:"order", id:  @order.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @order }
	      else
	        format.html { render :new }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def liqpay_request
		@liqpay_request = Liqpay::Request.new(	:amount => '999.99',
												:currency => 'UAH',
												:order_id => '123',
												:description => 'Some Product',
												:result_url => my_order_url )
	end
	def diver
		@order=Order.new()
		@order.address_ref=(Address.where(user: current_user)[0]||Address.new) 
		@address=Address.new
	end
	def order_params
   		params.require(:order).permit(:json)
   	end
   	def order_address_params
   		params.require(:order).require(:address_ref_attributes)
    end
end
