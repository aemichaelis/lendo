class FavouritesController < ApplicationController
  # def new
  #   @product = Product.find(params[:product_id])
  #   @favourite = Favourite.new
  # end

  def create
    @product = Product.find(params[:product_id])
    @favourite = Favourite.new
    @favourite.product = @product
    @favourite.user = current_user
    if @favourite.save
      redirect_to @product
      flash[:notice] = "Saved to favourites!"
    else
      render :new
    end
  end

  def index
    @favourites = current_user.favourites.all
  end
end
