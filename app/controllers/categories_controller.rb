class CategoriesController < ApplicationController
	before_action :must_be_logged_in

	def index
		@categories = Category.all
	end




	def show
		@category = Category.find(params[:id])
	end



end
