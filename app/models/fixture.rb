class Fixture < ActiveRecord::Base
	validates :name, presence: true
	validates :date, presence: true
	validates :location, presence: true
end
