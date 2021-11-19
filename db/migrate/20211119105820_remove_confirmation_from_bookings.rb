class RemoveConfirmationFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :confirmation
  end
end
