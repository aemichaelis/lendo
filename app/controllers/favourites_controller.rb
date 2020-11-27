class FavouritesController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @favourite = Favourite.new
  end

  def create
    @product = Product.find(params[:product_id])
    @favourite = Favourite.new
    @favourite.product = @product
    @favourite.user = current_user
    authorize @favourite
    if @favourite.save
      redirect_to @product
      flash[:notice] = "Saved to favourites!"
    else
      render :new
    end
  end

  def index
    @favourites = policy_scope(current_user.favourites)
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    authorize @favourite
    @favourite.destroy
    redirect_to favourites_path
  end
end
