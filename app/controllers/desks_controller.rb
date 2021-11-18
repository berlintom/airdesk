class DesksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_create :convert_money_to_cents

  def index
    @desks = Desk.all
  end

  def show
    @desk = Desk.find(params[:id])
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(params_desk)
    @desk.user = current_user
    @desk.save
    if @desk.save
      redirect_to desks_path
    else
      render :new
    end
  end

  private

  def params_desk
    params.require(:desk).permit(:title, :address, :description, :price, :photo)
  end

  def convert_money_to_cents
    self.price = price.to_i * 100
  end
end
