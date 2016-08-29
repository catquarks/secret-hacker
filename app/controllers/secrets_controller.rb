class SecretsController < ApplicationController
	before_action :must_be_logged_in
	before_action :must_be_admin, only: [:all_secrets, :destroy]

	def index
	end

	def all_secrets
		@secrets = Secret.all 
	end

	def must_be_admin
		unless current_user.admin 
			redirect_to secrets_path
		end
	end

	# def new
	# 	@secret=Secret.new
	# 	@key=Key.new
	# 	@categories = Category.all
	# end

	# def create
	# 	@secret=Secret.new(secret_params)
	# 	binding.pry
	# 	@secret.key=@key
	# 	@category = Category.find(params[:secret][:category_id])
	# 	@secret.category = @category
	#
	# 	if @secret.save && @key.save && @category.save
	# 		current_user.keys<<@key
	#
	# 		redirect_to :dashboard
	# 	else
	# 		render :new
	# 	end

	# end

	def show
		@secret=Secret.find(params[:id])
		# binding.pry
		unless current_user.key_ids.any?{|id| id==params[:id].to_i}
			render 'secrets/failure'
		end
	end




	private

	def secret_params
		params.require(:secret).permit(:content, :category_id, key: [:string])
	end

	# def key_params
	# 	params.require(:key).permit(:string)
	# end

end
