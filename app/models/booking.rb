class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :player

  validates :start_date, :end_date, presence: true

  def calculate_total_price(price_per_day)
    (end_date - start_date).to_i * price_per_day
  end
end
