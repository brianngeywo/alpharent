class RentalsController < ApplicationController
before_action :set_rental, only: [:edit, :update, :show, :destory]
    def index
      @rentals = Rental.all
  end
  
  def new
    @rental =Rental.new
  end
  def edit
  end
  
  def create
      if @rental.save
        flash[:success] = "We're all set, its all good"
        redirect_to rental_path(@rental)
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
  end
  def show
  end
  def update
      if @rental.update_attributes(rental_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @rental
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  def destroy
      if @rental.destroy
          flash[:success] = 'rental was successfully deleted.'
          redirect_to rentals_url
      else
          flash[:error] = 'Something went wrong'
          redirect_to rentals_url
      end
  end
  
     
  private
  def set_rental
    @rental = Rental.find(params[:id])
  end
  
  def rental_params
    params.require(:rental).permit(:title, :description)
  end
  
end