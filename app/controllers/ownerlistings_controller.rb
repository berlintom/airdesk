class OwnerlistingsController < ApplicationController
  def index
    @desks = Desk.where(user_id: current_user)
  end

  def show
    @desk = Desk.find(params[:id])
    @bookings = @desk.bookings
  end
end
