class HistoricImage < ActiveRecord::Base
	validates :image_url, presence: true
	default_scope { order("priority ASC") }
end
