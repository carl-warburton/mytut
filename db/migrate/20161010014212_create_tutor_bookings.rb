class CreateTutorBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :tutor_bookings do |t|
      t.references :user, :tutor
      t.references :user, :student
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
