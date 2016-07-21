class WelcomeController < BaseController
  def index
  	@orders = Order.all
  end
end
