class CommitteePosition < ActiveRecord::Base
	validates :position, presence: true
	validates :name, presence: true
	validates :image_url, presence: true
	validates :description, presence: true
	default_scope { order("priority ASC") }
end
