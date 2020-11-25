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
    if params[:query].present?
      sql_query = " \
        products.title @@ :query \
        OR products.description @@ :query \
        OR products.category @@ :query \
        OR products.brand @@ :query \
        OR products.model @@ :query "
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.order("created_at DESC").all
    end
  end

  private

  def product_params
    params.require(:product).permit!
  end
end
