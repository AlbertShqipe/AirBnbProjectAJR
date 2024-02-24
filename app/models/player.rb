class Player < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings

  has_one_attached :photo

  validates :name, :age, :position, :nationality, :foot, :club, :market_value, presence: true

  def self.sorted_by_position
    all.sort_by do |player|
      case player.position
      when 'gardien'
        1
      when 'défenseur'
        2
      when 'milieu'
        3
      when 'attaquant'
        4
      end
    end
  end
end
