class PagesController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
=======
  # skip_before_action :authenticate_user!, only: [:home, :index, :show]
>>>>>>> master

  def home
  end
end
