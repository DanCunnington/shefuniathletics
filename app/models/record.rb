class Record < ActiveRecord::Base
	validates :event, presence: true
	validates :event_type, presence: true
	validates :athlete, presence: true
	validates :time, presence: true
	validates :competition, presence: true
	default_scope { order("priority ASC") }
end
