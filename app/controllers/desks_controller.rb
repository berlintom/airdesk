class DesksController < ApplicationController
  # show all desks
  def index
    @desks = Desk.all
  end

  def show
    @desk = Desk.find(params[:id])
  end
end
