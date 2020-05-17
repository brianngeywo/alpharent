class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  def edit
    user = User.find(params[:id])
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the alpha rent"
        redirect_to rentals_path
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
  end
  def show
      @user = User.find(params[:id])
  end
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User was successfully updated"
        redirect_to @user
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  
  private
  def user_params
      params.require(:user).permit(:username, :email, :password)
  end
end
