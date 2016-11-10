class ProductCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = ProductCategory.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @category = ProductCategory.new(category_params)

    if @category.save
      flash[:success] = 'New product category created!'
      redirect_to product_categories_path
    else
      flash[:alert] = 'Can\'t create the product category, please check the form'
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Product category updated!'
      redirect_to product_categories_path
    else
      flash[:alert] = 'Can\'t update the product category, please check the form'
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Product category deleted!'
      redirect_to product_categories_path
    else
      flash[:alert] = 'Can\'t delete the product category!'
      render :index
    end
  end

  private

  def category_params
    params.require(:product_category).permit(:name)
  end

  def set_category
    @category = ProductCategory.find(params[:id])
  end

end
