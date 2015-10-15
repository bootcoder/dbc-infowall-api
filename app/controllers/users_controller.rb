class UsersController < ApplicationController

  def index
    @events = Event.all_meetups
    p " * " * 50
    ap @events
    p " * " * 50
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:session] = "Logged In"
      session[:id] = @user.id
      redirect_to root_path
    else
      flash[:new_user_error] = @user.errors
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password, :password_confirmation)
  end

end
