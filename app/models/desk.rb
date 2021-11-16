class Desk < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
