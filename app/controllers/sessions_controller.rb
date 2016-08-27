class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(name: params[:user][:name])
   # binding.pry
		if @user && @user.authenticate(params[:user][:password])
			session[:id] = @user.id
			redirect_to dashboard_path
		else
			redirect_to login_path, notice: "Username or Password not correct"
		end
	end

	def destroy
		reset_session
		redirect_to root_url
	end



end
