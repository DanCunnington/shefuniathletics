module ApplicationHelper
	def flash_class(level)
	    case level
	        when :notice then "alert alert-info"
	        when :success then "alert alert-success"
	        when :danger then "alert alert-danger"
	        when :alert then "alert alert-info"
	    end
	end

	def admin(user)
		if user.class.name == "User"
			return false
		else
			return true

		end

	end


end
