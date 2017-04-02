class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end

  def create
    @category = Category.find_or_create_by(category_params)
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    Category.delete(@category)
    flash[:success] = "#{@category.title} deleted!"
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end

end
