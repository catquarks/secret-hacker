class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  private

	  def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end

	  def logged_in?
	  	!!current_user
	  end

		def must_be_logged_in
			unless logged_in?
				redirect_to login_path
			end
		end

end
