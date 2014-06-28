class Admin < ActiveRecord::Base
	

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :first_name, presence: true, length: { maximum: 10 }	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 300 }, format: {with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }

	
	
	has_secure_password
	validates :password, length: {minimum: 6}

	def Admin.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Admin.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	
	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while Admin.exists?(column => self[column])
	end

	private

		def create_remember_token
			self.remember_token = Admin.hash(Admin.new_remember_token)
		end

end