class BaseController < ApplicationController
	
	before_filter :authorise

	protected

	def authorise
		if !session[:user_id]
        	redirect_to new_session_path
        end
	end

	# def  authorise
	# 	if session[:user_id] = nil 
	# 		redirect_to new_session_path
	# 	# elsif is_admin?			
	# 	#  	redirect_to new_session_path
	# 	else
	# 		redirect_to admin_root_path
	# 	end
	# end

end
   