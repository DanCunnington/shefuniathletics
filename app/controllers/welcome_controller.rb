class WelcomeController < ApplicationController

	def index
		@new_athlete = NewAthlete.new
	end

end
