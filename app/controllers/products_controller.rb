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
    @product.save
    redirect_to url_for products_index_url
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :product_category_ids => [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
