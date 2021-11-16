class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :booked_on, presence: true
end
