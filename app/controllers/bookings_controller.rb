class BookingsController < ApplicationController
  before_action :set_player, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.player = @player
    @user_id = current_user.id
    @booking.user_id = @user_id
    @booking.total_price = @booking.calculate_total_price(@player.price_per_day)
    if @booking.save
      redirect_to player_path(@player)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :player_id, :total_price)
  end
end
