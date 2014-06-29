module AdminSessionsHelper

	def sign_in(user)

		remember_token = Admin.new_remember_token
  		cookies.permanent[:remember_token] = remember_token
	    user.update_attribute(:remember_token, Admin.hash(remember_token))
	    self.current_admin_user = user

	end

	def signed_in?
    if current_admin_user != nil
    	#if current_admin_user.email == "dcunnington1@sheffield.ac.uk"
       # return true
     # else 
      #  return false
     # end
     return true
    else

      return false
  	end
  end

  	def current_admin_user=(user)
    	@current_admin_user = user
  	end

  	def current_admin_user
	    admin_remember_token = Admin.hash(cookies[:remember_token])

	
	    curr_admin = Admin.find_by(remember_token: admin_remember_token)


	    @current_user ||=curr_admin
	   
  	end

  	def sign_out_admin

    	current_admin_user.update_attribute(:remember_token,
                                    Admin.hash(Admin.new_remember_token))
    
  		cookies.delete(:remember_token)
    	self.current_admin_user = nil

  	end

  	def current_admin_user?(user)
    	user == current_admin_user
  	end

  	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
  	end

  	def store_location
    	session[:return_to] = request.url if request.get?
  	end

end