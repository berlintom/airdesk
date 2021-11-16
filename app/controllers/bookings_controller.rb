class BookingsController < ApplicationController
  def new
    @desk = Desk.find(params[:desk_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @desk = Desk.find(params[:desk_id])
    @booking.desk = @desk
    @booking.user = current_user
    @booking.save
    if @booking.save
      redirect_to desks_path
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:booked_on)
  end
end
