class WelcomeController < ApplicationController

	def index
		@new_athlete = NewAthlete.new
	end

	def membership
		@text = InfoPage.find_by(key: "membership").value
	end

	def committee

	end

	def coaches

	end

	def kit

	end

	def history

	end

	def records

	end

	def beginners_run_group
		@text = InfoPage.find_by(key: "beginners_run_group").value

	end


end
