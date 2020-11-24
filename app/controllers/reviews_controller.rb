class ReviewsController < ApplicationController
  before_action :booking, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @product = @booking.product
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find(@booking.product_id)
    @review.product = @product
    @review.booking = @booking
    @review.save!
    redirect_to product_path(@product)
  end

  private

  def booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
