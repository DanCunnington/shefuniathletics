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
		@coaches = Coach.all
	end

	def kit
		@kit_items = KitItem.all
		info_page_record = InfoPage.where(key:"kit_page")
		if info_page_record != []
			@text = InfoPage.find_by(key: "kit_page").value

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

	def getImagesFromCloudinary
		currentImages = Cloudinary::Api.resources(:max_results => 500)

		render :json => currentImages
	end


end
