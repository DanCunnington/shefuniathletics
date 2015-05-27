class CommitteePosition < ActiveRecord::Base
	validates :position, presence: true
	validates :name, presence: true
	#validates :image_url, presence: true
	validates :order, presence: true
	validates :description, presence: true
end
