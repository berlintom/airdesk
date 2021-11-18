class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    @desk = @booking.desk
  end

  def new
    @desk = Desk.find(params[:desk_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @desk = Desk.find(params[:desk_id])
    @booking.desk = @desk
    @booking.user = current_user
    @booking.saveb
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end
end
