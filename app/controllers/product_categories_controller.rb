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
    @category = ProductCategory.new(params.require(:product_category).permit(:name))
    @category.save
    redirect_to product_categories_path
  end

  def update
    if @category.update(params.require(:product_category).permit(:name))
      redirect_to product_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to product_categories_path
  end

  private

  def set_category
    @category = ProductCategory.find(params[:id])
  end

end
