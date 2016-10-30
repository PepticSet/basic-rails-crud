class ProductCategoriesController < ApplicationController
  def index
    @categories = ProductCategory.all
  end

  def show
    @category = ProductCategory.find(params[:id])
  end

  def new
  end

  def edit
    @category = ProductCategory.find(params[:id])
  end

  def create
    @category = ProductCategory.new(params.require(:product_category).permit(:name))
    @category.save
    redirect_to product_categories_path
  end

  def update
    @category = ProductCategory.find(params[:id])
    if @category.update(params.require(:product_category).permit(:name))
      redirect_to product_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = ProductCategory.find(params[:id])
    @category.destroy
    redirect_to product_categories_path
  end

end
