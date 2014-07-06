class UserMailer < ActionMailer::Base
  default from: "uosathletics@gmail.com"

  def sign_up_email(athlete)
  	@email = athlete.email
  	@name = athlete.name

  	mail(to: "sympa@lists.shef.ac.uk", subject:'')

  end

  def admin_invite_email(admin)

  	@admin = admin
  	@url = "http://new.shefuniathletics.co.uk/admin"
  	mail(to: @admin.email, subject: "Your new shefuniathletics admin account!")


  end
end
