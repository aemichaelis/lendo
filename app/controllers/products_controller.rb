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
    if params[:query].present?
      sql_query = " \
        products.title @@ :query \
        OR products.description @@ :query \
        OR products.category @@ :query \
        OR products.brand @@ :query \
        OR products.model @@ :query "
      @products = policy_scope(Product.where(sql_query, query: "%#{params[:query]}%"))
    else
      @products = policy_scope(Product.order("created_at DESC").all)
    end
     # @products = policy_scope(Product)
     @favourite = Favourite.new
  end


  def myproducts
    @products = policy_scope(Product.where(user: current_user))
    authorize @products
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)
    redirect_to myproducts_path
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to myproducts_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :address, :category, :price, :accessories, :condition, :brand, :model, :delivery_method, :photos)
  end
end
