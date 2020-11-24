class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end
  
  def new
    @booking = Booking.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = @product
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
