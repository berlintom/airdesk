class User < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  has_many :desks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
