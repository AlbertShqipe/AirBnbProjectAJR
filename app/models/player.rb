class Player < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings

  validates :name, :age, :position, :nationality, :foot, :club, :market_value, presence: true
end
