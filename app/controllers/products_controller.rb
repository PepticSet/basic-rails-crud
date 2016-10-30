class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :price, :product_category_ids => []))
    @product.save
    redirect_to url_for products_index_url
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(params.require(:product).permit(:name, :description, :price, :product_category_ids => []))
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

end
