class CartsController < ApplicationController
	before_action :authenticate_user! , :only => [:create_order, :diver , :order ]
	def order_create
		@order=Order.new(order_params)
		@address=Address.find(order_params[:address])
		@order.user=current_user
		@order.address=@address.city+" "+@address.address+" "+@address.seccond_address+" "+@address.post_index
		puts order_params[:json]
	    respond_to do |format|
	      if @order.save
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
