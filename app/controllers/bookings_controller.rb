class BookingsController < ApplicationController
  def index
    # @bookings = current_user.bookings
    @bookings = policy_scope(current_user.bookings)
    @upcoming_bookings = @bookings.where("check_in >= ?", Date.today)
    @previous_bookings = @bookings.where("check_out <= ?", Date.today)
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
        flash[:notice] = "Oops! Please enter a valid date"
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
      flash[:notice] = "Your booking request was successful!"
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(confirmed: params.dig("booking", "confirmed"))
    @booking.save
    redirect_to requests_path
    flash[:notice] = "Your booking request was successful!"
    authorize @booking
    Notification.create(recipient: @booking.user, actor: @booking.product.user, action: "changed status", notifiable: @booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
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
