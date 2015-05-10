module SessionsHelper

	# Logs  in the given user
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns the current logged-in user (if any).
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		elseif cookies.signed[:user_id]
			user = User.find_by(id: cookies.signed[:user_id])
			if user && user.authenticated?(cookies[:remember_token])
				log_in user_id
				@current_user = user
			end
		end
	end

	# Returns true if the user is logged-in, otherwise false
	def logged_in?
		!current_user.nil?
	end

	# Logs out the current user
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	# Remembers a user in a persistent session
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

end
