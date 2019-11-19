class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page],per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Create new category"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
