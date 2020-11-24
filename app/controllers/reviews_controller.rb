class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.save!
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
