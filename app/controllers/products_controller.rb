class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def show
    @product = Product.find(params[:id])
    authorize @product
    @favourite = Favourite.new
  end

  def new
    @categories = ['Computers', 'Phones & Mobile Tech', 'Cameras', 'Gaming', 'Music', 'Home', 'Drones', 'Other']
    @condition = ['Like New', 'Normal Wear', 'Minor Cosmetic Faults', 'Minor Functional Faults']
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    # @products = Product.all
    @products = policy_scope(Product)
  end

  private

  def product_params
    params.require(:product).permit!
  end
end
