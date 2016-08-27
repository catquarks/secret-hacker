class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	before_action :must_be_logged_in, only: [:dashboard]

	def index
		@users = User.all
	end

	def show
	end

	def dashboard
	end

	def edit
	end

	private
		def set_user
			@user = User.find(params[:id])
		end



end
