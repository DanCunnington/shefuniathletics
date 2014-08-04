class RecRunRoute < ActiveRecord::Base
	validates :name, presence: true
	validates :distance, presence: true
	validates :difficulty, presence: true
	VALID_LINK_REGEX = /\Ahttps:\/\/mapsengine.google.com\/+[\w+\-.]/i
	#validates :google_maps_link, presence: true, format: {with: VALID_LINK_REGEX}

end
