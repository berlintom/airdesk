class RemoveBookedOnDateFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :booked_on, :date
  end
end
