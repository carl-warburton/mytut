class TutorProfile < ApplicationRecord
  belongs_to :user
  has_many :tutor_bookings, dependent: :destroy
end
