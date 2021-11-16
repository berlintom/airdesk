class DesksController < ApplicationController
  # show all desks
  def index
    @desks = desks.all
  end
end
