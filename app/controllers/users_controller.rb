class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destory]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to the alpha rent"
        redirect_to user_path(@user)
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
  end
  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
      flash[:success] = 'User was successfully deleted.'
      redirect_to users_path
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

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "you can only edit your own account"
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "only admins can perform that action"
      redirect_to root_path
    end
  end
  
end
