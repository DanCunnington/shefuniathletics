class UserMailer < ActionMailer::Base
  default from: "uosathletics@gmail.com"

  def sign_up_email(athlete)
  	@email = athlete.email
  	@name = athlete.name

  	mail(to: "sympa@lists.shef.ac.uk", subject:'')

  end
end
