class AdminSessionsController < ApplicationController
include AdminSessionsHelper
	def create
		admin = Admin.find_by(email: params[:admin_session][:email].downcase)

		if admin && admin.authenticate(params[:admin_session][:password])
			sign_in admin
			redirect_back_or admin
		else
              @error = 'Invalid email/password combination'
              render '_failed'
        end

	end

	def destroy
		
		sign_out
		flash[:danger] = "You have signed out of your admin account."
    	redirect_to root_url
	end

end