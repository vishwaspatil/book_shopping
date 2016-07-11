class StoreController < ApplicationController
	layout "application"
  def index
  	 @products = Product.order(:title)
  end
end
