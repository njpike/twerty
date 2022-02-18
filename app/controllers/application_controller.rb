class ApplicationController < ActionController::Base
	helper_method def current_user
		return @current_user if @current_user.present?
		if session[:user_id].present?
			@current_user = User.find(session[:user_id])
		end
	end
end
