class StudentProfile < ApplicationRecord
  belongs_to :user
  has_many :tutor_bookings
end
