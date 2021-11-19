class OwnerlistingsController < ApplicationController
  def index
    @desks = Desk.where(user_id: current_user).order(created_at: :desc)
  end

  def show
    @desk = Desk.find(params[:id])
    @bookings = @desk.bookings
  end
end
