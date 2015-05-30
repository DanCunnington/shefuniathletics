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
		@background = InfoPage.find_by(key: "history_background").value

		@historic_images = HistoricImage.all

		keyDates = KeyDate.all

		@key_dates_1,@key_dates_2 = keyDates.each_slice( (keyDates.size/2.0).round ).to_a
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

	def deleteCloudinaryImage
		image_id = params[:image_id]

		Cloudinary::Api.delete_resources([image_id])
		render :json => {ok: true}
	end


end
