class RentalsController < ApplicationController
  before_action :set_rental, only: [:edit, :update, :show, :destory]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end
  
  def new
    @rental =Rental.new
  end
  def edit
    @rental = Rental.find(params[:id])
  end
  
  def create
    @rental =Rental.new(rental_params)
    @rental.user = current_user
      if @rental.save
        flash[:success] = "We're all set, its all good"
        redirect_to rental_path(@rental)
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
  end
  def show
    @rental = Rental.find(params[:id])
  end
  def update
    @rental = Rental.find(params[:id])
    if @rental.update_attributes(rental_params)
      flash[:success] = "rental was successfully updated"
      redirect_to @rental
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    flash[:success] = 'rental was successfully deleted.'
    redirect_to rentals_url
  end  
     
  private
  
  def rental_params
    params.require(:rental).permit(:title, :description)
  end
  
  def set_rental
    @rental = Rental.find(params[:id])
  end
  def require_same_user
    if current_user != @rental.user
        flash[:danger] = "you must be the owner of the rental"
        redirect_to root_path
    end
end
end