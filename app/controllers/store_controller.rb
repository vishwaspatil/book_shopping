class StoreController < ApplicationController
 	require './createcart'
	include CreateCart 
	layout "application"
	before_action :current_cart, only: [:index]
  def index
  	 @products = Product.order(:title)
  	 @cart = current_cart	
  end
end
