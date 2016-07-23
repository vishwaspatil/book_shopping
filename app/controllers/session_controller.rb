class SessionController < ApplicationController
  def new
  end

  def create

    
  	@name = params[:name]
  	@password = params[:password]
  	# puts "==================#{@password}"

	  user = Admin.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_order_path
    else

       render 'new'
    end
  end

  def destroy
  	 session[:user_id] = nil
  	 redirect_to root_path, notice => "You've successfully logged out."
      puts "-------------------"
      puts session[:user_id]
      puts "--------------------"
  end
end
 