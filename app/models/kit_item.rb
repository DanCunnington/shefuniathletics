class KitItem < ActiveRecord::Base
	validates :name, presence: true
	validates :image_url, presence: true
	validates :url, presence: true
	default_scope { order("priority ASC") }
end
