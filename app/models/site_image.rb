class SiteImage < ActiveRecord::Base
	validates :reference, presence: true
	validates :image_url, presence: true
end
