class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    raise
    @user = current_user
  end

  def index
    @players = Player.where(owner_id: current_user)
    @bookings = current_user.bookings
    @user = current_user
  end
end
