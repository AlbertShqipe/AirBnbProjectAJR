class DashboardsController < ApplicationController
  def index
    @players = Player.where(owner_id: current_user)
    @bookings = current_user.bookings
    @today = Date.today
  end
end
