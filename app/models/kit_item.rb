class KitItem < ActiveRecord::Base
	validates :name, presence: true
	validates :image_url, presence: true

	VALID_LINK_REGEX = /\Ahttp:/i
	validates :url, presence: true, format: {with: VALID_LINK_REGEX}
	default_scope { order("priority ASC") }
end
