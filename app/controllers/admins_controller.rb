class AdminsController < ApplicationController
include AdminSessionsHelper
  	before_action :signed_in_admin, only: [:show, :edit, :update]
	before_action :correct_user,   only: [:show, :edit, :update]

	def new
		@admin = Admin.new
	end


	def show
		@admin = Admin.find(params[:id])
		if @admin.super_admin
			@account_type = "Super Admin"
		else 
			@account_type = "Admin"
		end
	end


	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			UserMailer.admin_invite_email(@admin).deliver
			flash[:success] = "Admin was successfully created"
			redirect_to current_admin_user
		else
			flash[:danger] = "Could not add account"
			redirect_to current_admin_user
		end
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:id])
		if @admin.update_attributes(admin_params)
			flash[:success] = "Profile updated"
			redirect_to @admin
		else
			render 'edit'
		end
	end

	
	def destroy
	   	x = Admin.find(params[:id])
	   	x.destroy
	    flash[:danger] = "Admin Deleted."
	    respond_to do |format|
	      format.html { redirect_to admin_users_admins_path }
	      format.json { head :no_content }
	    end
	end

	def users
		@users = User.all
	end

	def admin_users
		@users = Admin.all
	end

	def new_athletes
		@athletes = NewAthlete.all
	end

	private

	def admin_params
		params.require(:admin).permit(:first_name, :email, 
			:password, :password_confirmation)
	end

	# Before filters

    def signed_in_admin
      unless signed_in?
        store_location
        flash[:danger] = "Please sign in."
        redirect_to root_url
      end
    end

    def correct_user
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_admin_user?(@admin)
    end


end
