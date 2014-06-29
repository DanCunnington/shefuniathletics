class RecRunRoute < ActiveRecord::Base
	validates :name, presence: true
	validates :distance, presence: true
	validates :difficulty, presence: true
	validates :google_maps_link, presence: true
end
