class Coach < ActiveRecord::Base
	validates :role, presence: true
	validates :name, presence: true
	validates :image_url, presence: true
	validates :description, presence: true
	default_scope { order("priority ASC") }
end
