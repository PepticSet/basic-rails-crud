class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = t('products.create.success')
      redirect_to url_for products_index_url
    else
      flash[:alert] = t('products.create.alert')
      render :new
    end

  end

  def update
    if @product.update(product_params)
      flash[:success] = t('products.update.success')
      redirect_to products_path
    else
      flash[:alert] = t('products.update.alert')
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t('products.destroy.success')
      redirect_to products_path
    else
      flash[:alert] = t('products.destroy.alert')
      render :index
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :product_category_ids => [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
