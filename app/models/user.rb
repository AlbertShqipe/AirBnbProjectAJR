class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players
  has_many :bookings_as_owner, through: :players, source: :bookings
  has_many :bookings

  validates :first_name, :last_name, presence: true
end
