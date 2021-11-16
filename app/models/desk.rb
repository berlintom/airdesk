class Desk < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
