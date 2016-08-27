class SecretsController < ApplicationController
	before_action :must_be_logged_in

	def index
		@secrets = Secret.all
	end

	def show
	end




end
