class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_username(session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:id] = @user.id
      flash[:session] = "Logged In"
      redirect_to root_path
    else
      flash[:invalid_login] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    flash[:session] = "Logged Out"
    session[:id] = nil
    @current_user = nil
    redirect_to root_path
  end


  private

  def session_params
    params.require(:session).permit(:username, :password, :password_confirmation)
  end

end
