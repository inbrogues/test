class PagesController < ApplicationController
  
  def index
    @products=Product.order("updated_at").limit(8)
    @baners=Baner.where("number > ?" , 0) 
  end
  def page
    @pages=Page.where.not(order:  nil).order(order:  :desc)
    @page=Page.find_by(link: params[:link])
  end

  def search_results
  end

  def lockscreen
    render :layout => "empty"
  end

  def invoice
  end

  def invoice_print
    render :layout => "empty"
  end

  def login
    render :layout => "empty"
  end

  def login_2
    render :layout => "empty"
  end

  def forgot_password
      render :layout => "empty"
  end

  def register
    render :layout => "empty"
  end

  def internal_server_error
    render :layout => "empty"
  end

  def empty_page
  end

  def not_found_error
    render :layout => "empty"
  end

end
