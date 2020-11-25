class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @favourite = Favourite.new
  end

  def new
    @categories = ['Computers', 'Phones & Mobile Tech', 'Cameras', 'Gaming', 'Music', 'Home', 'Drones', 'Other']
    @condition = ['Like New', 'Normal Wear', 'Minor Cosmetic Faults', 'Minor Functional Faults']
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def myproducts
    @products = current_user.products
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product.update(product_params)
    redirect_to myproducts_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to myproducts_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :address, :category, :price, :accessories, :condition, :brand, :model, :delivery_method, :photos)
  end
end
