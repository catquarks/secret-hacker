class SecretsController < ApplicationController
	before_action :must_be_logged_in



	def index
		@user=User.find(session[:user_id])
		@secrets = Secret.all
	end

	def new
		@secret=Secret.new
		@key=Key.new
	end

	def create
		@secret=Secret.new(secret_params)
		@key=Key.new(key_params)
		@secret.key=@key
		if @secret.save && @key.save
			current_user.keys<<@key
			redirect_to :dashboard
		else
			render :new
		end

	end

	def show
		@secret=Secret.find(params[:id])
		unless current_user.key_ids.any?{|id| id==params[:id].to_i}
			render 'secrets/failure'
		end
	end


	private

	def secret_params
		params.require(:secret).permit(:content, :subject, :key)
	end

	def key_params
		params.require(:key).permit(:string)
	end

end
