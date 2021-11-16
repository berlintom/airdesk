class BookingsController < ApplicationController
  def new
    @desk = Desk.find(params[:desk_id])
    @booking = Booking.new
  end
end
