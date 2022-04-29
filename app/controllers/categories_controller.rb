class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update delete ]

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
    if @category.update(category_params)
      redirect_to category_path
    end
  end

  def delete
  end
  
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
