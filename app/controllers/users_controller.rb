class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
  	find_user
	end

	private

	def find_user
		@user = User.find(params[:id])
	end
end
