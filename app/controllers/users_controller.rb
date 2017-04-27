class UsersController < ApplicationController
	before_action :authenticate_user!
	def profile
		if user_signed_in?
			@user=current_user
		end
	end
	def my_address
		@addresses=Address.where(user_id: current_user.id)
		@address_new=Address.new
	end
	def address_create
		address=Address.new(address_params)
		address.user=current_user
		respond_to do |format|
			if address.save
				format.html { redirect_to controller:"users", action:"my_address", notice: 'address was successfully created.' }
				format.json { render  status: :ok }
		      else
		        format.html { redirect_to controller: "users", action:"my_address", notice: 'Some error.' }
		        format.json { render json: @product.errors, status: :unprocessable_entity }	
			end
		end
	end
	def address_update
		address=Address.find(params[:id])
		respond_to do |format|
			if address.update(address_params)
				format.html { redirect_to controller:"users", action:"my_address", notice: 'address was successfully update.' }
				format.json { render  status: :ok }
		      else
		        format.html { redirect_to controller: "users", action:"my_address", notice: 'Some error.' }
		        format.json { render json: @product.errors, status: :unprocessable_entity }	
			end
		end
	end
	def address_destroy
		address=Address.find(params[:id])
		address.destroy
		respond_to do |format|
			format.html {redirect_to controller:"users", action:"my_address", notice: 'address was successfully delete.' }
			format.json { render  status: :ok }
		end
	end
	def address_params
      params.require(:address).permit(:address , :seccond_address , :city, :post_index)
    end


    def my_overview
		@orders=Order.where(user_id: current_user.id)
	end
	def my_order
		@orders=Order.where(user_id: current_user.id)
	end

end
