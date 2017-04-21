module ProductsHelper
	def favourite_datums
		if favourite_ids?
			return []
		else
	    	return ProductDatum.where(id: favourite_ids())
		end
    end
    def favourite_ids
    	return session[:favorite]||[]
    end
    def favourite_ids?
    	return favourite_ids==[]
    end

end
