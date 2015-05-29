class WelcomeController < ApplicationController

	def index
		@new_athlete = NewAthlete.new
	end

	def membership
		@text = InfoPage.find_by(key: "membership").value 
	end

	def committee
		@committee_positions = CommitteePosition.all
	end

	def coaches

	end

	def kit
		@kit_items = KitItem.all
		info_page_record = InfoPage.where(key:"kit_page")
		if info_page_record != []
			@text = info_page_record.value

		else
			@text = ""
		end
		
	end

	def history

	end

	def records

	end

	def beginners_run_group
		@text = InfoPage.find_by(key: "beginners_run_group").value

	end


end
