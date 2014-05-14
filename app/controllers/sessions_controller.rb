class SessionsController < ApplicationController

	def new
		
	end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      redirect_to signin_path, flash: { danger: 'Combinación de correo/password invalida' }
    end
  end

	def destroy
		sign_out
		redirect_to signin_path
	end
end
