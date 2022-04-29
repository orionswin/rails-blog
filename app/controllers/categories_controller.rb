class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    # @category = Category.new
    # @category.name = params[:title]
    # @category.body = params[:description]
    

    if @category.save
      redirect_to '/categories'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to '/categories'
    end
  end

  def delete
  end
  
  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
