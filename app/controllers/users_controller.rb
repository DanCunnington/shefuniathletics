class UsersController < ApplicationController

	def profile
		@user = User.find(params[:id])

	end

	def my_splits
		@user = User.find(params[:id])
	end

end