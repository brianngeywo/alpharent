class CategoriesController < ApplicationController
    before_action :require_admin_user, except: [:index, :show]
    
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
    def edit
        @category = Category.find(params[:id])
    end
    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(category_params)
        flash[:success] = "category name was successfully updated"
        redirect_to category_path(@category)
        else
        flash[:error] = "Something went wrong"
        render 'edit'
        end
    end
    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
            flash[:success] = 'Category was successfully deleted.'
            redirect_to categories_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to category_path(@category)
        end
    end
    
     
    
    private
    def category_params
        params.require(:category).permit(:name)
    end
    def require_admin_user
        if !current_user.admin?
            flash[:danger] = "only admin can add or edit categories"
            redirect_to root_path
        end
      end
    
end
