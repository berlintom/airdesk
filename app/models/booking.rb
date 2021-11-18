class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :start_date, presence: true
end
