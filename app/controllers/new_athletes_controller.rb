class NewAthletesController < ApplicationController
	
	def new
		@new_athlete = NewAthlete.new
	end

	def show
		@new_athlete = NewAthlete.find(params[:id])
	end

	def create
		@new_athlete = NewAthlete.new(new_athlete_params)
		@new_athlete.name = @new_athlete.first_name + " " + @new_athlete.surname
		if @new_athlete.save
			UserMailer.sign_up_email(@new_athlete).deliver
			flash[:success] = "You have successfully signed up to the newsletter #{@new_athlete.name}"
			redirect_to newsletter_path
		else
			render 'new'
		end
	end

	def delete_all
		NewAthlete.delete_all
		flash[:danger] = "New Athletes Deleted."
	    respond_to do |format|
	      format.html { redirect_to new_athletes_admins_path }
	      format.json { head :no_content }
	    end
	end

	

	

	private

		def new_athlete_params
			params.require(:new_athlete).permit(:first_name, :surname, :email)
		end



end
