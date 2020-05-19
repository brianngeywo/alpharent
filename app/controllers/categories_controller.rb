class CategoriesController < ApplicationController
    before_action :require_admin_user, only: [:new]
    
    def index
        @categories = Category.all
    end
    
    def show
        @category = Category.find(params[:id])
        @category_rentals = @category.rentals
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
          flash[:success] = "category successfully created"
          redirect_to @category
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private
    def category_params
        params.require(:category).permit(:name)
    end
    def require_admin_user
        if !current_user.admin?
            flash[:danger] = "only admin can add new categories"
            redirect_to root_path
        end
      end
    
end
