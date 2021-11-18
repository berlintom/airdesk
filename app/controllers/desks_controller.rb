class DesksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @desks = Desk.all
  end

  def show
    @desk = Desk.find(params[:id])
  end

  def new
    @desk = Desk.new
  end
end
