class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :must_be_logged_in, only: [:dashboard, :edit]

	def index
		@users = User.all
	end

	def create
		@user=User.new(user_params)
		if @user.save
			session[:user_id]=@user.id
			redirect_to :dashboard
		else
			render 'registrations/new'
		end
	end

	def show
  # binding.pry
		if session[:user_id] == params[:id].to_i
			redirect_to :dashboard
		end
	end

	def dashboard
	end

	def edit
  # binding.pry
		unless current_user.id == params[:id].to_i
			redirect_to users_path
		end
	end

	def update
		if @user.update(user_params)
			redirect_to :dashboard
		else
			render :edit
		end
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation, :bio)
		end


end
