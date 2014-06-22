class NewAthlete < ActiveRecord::Base

	attr_accessor :first_name
	attr_accessor :surname

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@sheffield.ac.uk/i
	validates :email, presence: true, length: { maximum: 300 }, format: {with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }

	validates :first_name, presence: true
	validates :surname, presence: true
end
