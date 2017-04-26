class CartsController < ApplicationController
	before_action :authenticate_user! , :only => [:create_order, :diver , :order ]
	def order_create
		@order=Order.new(order_params)
		@address=Address.find(order_params[:address])
		@order.user=current_user
		@order.address=@address.city+" "+@address.address+" "+@address.seccond_address+" "+@address.post_index
		puts order_params[:json]
		#[{"status":"ok","message":"Success!","html":"<b>...</b>","name":"test 3","src":"/system/photos/imgs/000/000/007/original/hmprod-3.jpeg?1493236646","price":3000,"promotional_price":100,"article":"2020","color":"wert","sizes":[],"size":"9","id":7,"count":2}]
		#"size":"9","id":7,"count":2
		#,count: nil, product_size_id: nil, product_datum_id: nil
		data = JSON.parse order_params[:json]
			OrdersProductDatum
	    

	    respond_to do |format|
	      if @order.save
	      	data.each { |d|
	      		a=OrdersProductDatum.new
	      		a.order_id=@order.id
	      		a.count=data.count
	      		a.product_size_id=data.id
	      		a.size=ProductSize.find_by(size: data.size)
	      		a.save
	      	}
	        format.html {redirect_to controller:"carts", action:"order", id:  @order.id , notice: 'Color was successfully created.' }
	        format.json { render :show, status: :created, location: @order }
	      else
	        format.html { render :new }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def diver
		@order=Order.new()
		@address=Address.where(user: current_user)
	end
	def order_params
   		params.require(:order).permit(:address,:json)
   	end
end
