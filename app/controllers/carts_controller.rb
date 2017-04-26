class CartsController < ApplicationController
	before_action :authenticate_user! , :only => [:create_order, :diver , :order ]
	def order_create
		@order=Order.new(order_params)
		@address=Address.find(order_params[:address])
		@order.user=current_user
		@order.address=address.city+" "+address.address+" "+address.seccond_address+" "+address.post_index
		@order.save
	end
	def diver
		@address=Address.where(user: current_user)
	end
	def order_params
   		params.require(:order).permit(:address)
   	end
end
