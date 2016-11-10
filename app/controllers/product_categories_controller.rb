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
      flash[:success] = t('product_categories.create.success')
      redirect_to product_categories_path
    else
      flash[:alert] = t('product_categories.create.alert')
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = t('product_categories.update.success')
      redirect_to product_categories_path
    else
      flash[:alert] = t('product_categories.update.alert')
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t('product_categories.destroy.success')
      redirect_to product_categories_path
    else
      flash[:alert] = t('product_categories.destroy.alert')
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
