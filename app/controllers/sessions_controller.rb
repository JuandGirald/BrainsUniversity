class SessionsController < ApplicationController

  def new
    redirect_to edit_user_path(@current_user) if signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or edit_user_path(@current_user)
    else
      flash.now[:error] = 'Invalid email/password combination'
      redirect_to signin_path, flash: { danger: 'Combinación de correo/contraseña invalida' }
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
