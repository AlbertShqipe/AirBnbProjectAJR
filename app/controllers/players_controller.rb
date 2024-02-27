class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    params[:query].present? ? @players = Player.where("position ILIKE ?", "%#{params[:query]}%") : @players = Player.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.price_per_day = params[:player][:market_value].to_i / 365000
    @user_id = current_user.id
    @player.owner_id = @user_id
    if @player.save
      redirect_to player_path(@player)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to player_path(@player)
  end

  def destroy
    @player.destroy
    redirect_to players_path, status: :see_other
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :position, :age, :address, :nationality, :height, :foot, :club, :market_value, :price_per_day, :photo, :owner_id, :img)
  end
end
