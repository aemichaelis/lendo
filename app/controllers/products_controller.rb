class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
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
    @products = find_products
    @products = filter_products

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

  def find_products
    sql_query = " \
        products.title @@ :query \
        OR products.description @@ :query \
        OR products.category @@ :query \
        OR products.brand @@ :query \
        OR products.model @@ :query "
    @products = policy_scope(Product.order("created_at DESC").all)
    @products = policy_scope(@products.where(sql_query, query: "%#{params[:query]}%")) if params[:query].present?
    @products = policy_scope(@products.where('products.address ILIKE ?', "%#{params[:address]}%")) if params[:address].present?
    @products
  end

  def filter_products
    @products = @products.by_min_price(params[:price_min]) if params[:price_min].present?
    @products = @products.by_max_price(params[:price_max]) if params[:price_max].present?
    if params[:product].present?
      @products = @products.by_delivery_method(params[:product][:delivery_method]) if params[:product][:delivery_method].present?
      @products = @products.by_condition(params[:product][:condition]) if params[:product][:condition].present?
      @products = @products.by_brand(params[:product][:brand]) if params[:product][:brand].present?
    end
    @products
  end

  def product_params
    params.require(:product).permit(:title, :description, :address, :category, :price, :accessories, :condition, :brand, :model, :delivery_method, :photos)
  end
end
