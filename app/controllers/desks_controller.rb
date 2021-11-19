class DesksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @desks = Desk.all.order(created_at: :desc)
  end

  def show
    @desk = Desk.find(params[:id])
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(params_desk)
    @desk.price = @desk[:price].to_i * 100
    @desk.user = current_user
    @desk.save
    if @desk.save
      redirect_to ownerlistings_path
    else
      render :new
    end
  end

  private

  def params_desk
    params.require(:desk).permit(:title, :address, :description, :price, :photo)
  end

end
