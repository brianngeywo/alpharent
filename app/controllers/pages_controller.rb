class PagesController < ApplicationController
  def index
    redirect_to rentals_path if logged_in?
  end    
end
