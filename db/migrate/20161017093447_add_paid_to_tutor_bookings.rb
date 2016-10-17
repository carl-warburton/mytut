class AddPaidToTutorBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :tutor_bookings, :paid, :boolean
  end
end
