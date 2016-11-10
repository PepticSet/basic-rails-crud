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
      flash[:success] = 'New product created!'
      redirect_to url_for products_index_url
    else
      flash[:alert] = 'Can\'t create the product, please check the form'
      render :new
    end

  end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product updated!'
      redirect_to products_path
    else
      flash[:alert] = 'Can\'t update the product, please check the form'
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = 'Product deleted!'
      redirect_to products_path
    else
      flash[:alert] = 'Can\'t delete the product!'
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
