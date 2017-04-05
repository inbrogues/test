class AdminController < ApplicationController
  def colors
  	@colors = Color.all
  	@newColor=Color.new
  end

  def news
  end

  def products
  end

  def categories
  end
end
