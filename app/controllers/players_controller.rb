class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  def index
    @players = Player.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @user_id = current_user.id
    @player.owner_id = @user_id
    # raise
    if @player.save
      redirect_to player_path(@player)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :position, :age, :address, :nationality, :height, :foot, :club, :market_value, :price_per_day, :photo, :owner_id)
  end
end
