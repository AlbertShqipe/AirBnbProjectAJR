class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def index
    @user = current_user
    @players = Player.where(owner_id: current_user).sorted_by_position
    @bookings = current_user.bookings
    @today = Date.today
    @gardiens = Player.where(owner_id: current_user).where(position: "gardien")
    @defenseurs = Player.where(owner_id: current_user).where(position: "défenseur")
    @milieux = Player.where(owner_id: current_user).where(position: "milieu")
    @attaquants = Player.where(owner_id: current_user).where(position: "attaquant")
  end
end
