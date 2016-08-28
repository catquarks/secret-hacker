class RegistrationsController < ApplicationController

	# before_action :set_registration
	def new
		@user = User.new
	end

	private

		def destroy
		end
end
