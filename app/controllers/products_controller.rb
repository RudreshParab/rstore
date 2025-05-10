class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destory]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(filtered_params)

    if @product.save
      redirect_to products_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(filtered_params)
      redirect_to @product
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def show
  end

  def destory
    @product.destory
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def filtered_params
    params.require(:product).permit(%i[name price description featured_image inventory_count])
  end
end
