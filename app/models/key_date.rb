class KeyDate < ActiveRecord::Base
	validates :description, presence: true
	default_scope { order("priority ASC") }
end
