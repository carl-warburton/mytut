class CreateTutorBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :tutor_bookings do |t|
      t.references :tutor_profile, foreign_key: true
      t.references :student_profile, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :approved

      t.timestamps
    end
  end
end
