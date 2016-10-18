class AddRateToTutorBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :tutor_bookings, :rate, :decimal, precision: 8, scale: 2
  end
end
