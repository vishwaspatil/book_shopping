class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
	 product.price * quantity.to_i	  	
  end
end
# define method as total_price in model of line item.which return the total price of individual line item.
