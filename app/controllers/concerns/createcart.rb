module CreateCart
  

  extend ActiveSupport::Concern  

      def current_cart
      	@cart = Cart.find(session[:cart_id])
      	rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        return @cart     
      end
      
  
end