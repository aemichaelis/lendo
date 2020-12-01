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
      if params[:booking][:check_in].blank? || params[:booking][:check_out].blank?
        redirect_to product_path(@product)
        flash[:notice] = "Please enter a valid date"
      else
        redirect_to confirm_path(product_id: params[:product_id], booking: booking_params)
      end
    end
  end

  def save_booking
    @product = Product.find(params[:product_id])
    @booking = Booking.new(check_in: params[:check_in], check_out: params[:check_out])
    @booking.user = current_user
    @booking.product = @product
    authorize @booking
    if @booking.save
      @chatroom = Chatroom.create(name: @booking.product.title)
      @chatroom.booking = @booking
      @chatroom.p1_id = @booking.user.id
      @chatroom.p2_id = @booking.product.user.id
      @chatroom.save
      redirect_to bookings_path
      flash[:notice] = "Booking request was successful!"
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
