class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email].downcase)
		if user && user.authenticate(params[:password])
			sign_in(user, params[:remember_me])
			redirect_back_or bookings_path
		else
			# Use flash.now for disapear website
			flash.now[:error] = 'Flasches Logindaten'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
