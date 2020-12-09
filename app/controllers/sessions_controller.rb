class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Sesión iniciada"
    else
      flash.now[:notice]= 'Email o contraseña inválida'
      render action: :new
    end
  end

  def destroy
    def destroy
      session[:user_id] = nil
      redirect_to stories_path, notice: "Sesión cerrada"
    end

  end
end
