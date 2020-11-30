class BookingsController < ApplicationController
  def index
    # @bookings = current_user.bookings
    @bookings = policy_scope(current_user.bookings)
  end

  def new
    @booking = Booking.new
    @product = Product.find(params[:product_id])
    authorize @booking
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = @product
    authorize @booking
    if params[:commit] == "Reserve"
      redirect_to confirm_path(product_id: params[:product_id], booking: booking_params)
    end
  end

  def save_booking
    @product = Product.find(params[:product_id])
    @booking = Booking.new(check_in: params[:check_in], check_out: params[:check_out])
    @booking.user = current_user
    @booking.product = @product
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def confirm
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    authorize @product
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
