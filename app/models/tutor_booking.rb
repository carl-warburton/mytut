class TutorBooking < ApplicationRecord

  belongs_to :tutor, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :date, presence: true

  # the rate in $/hr of the booking
  def rates
    self.tutor.tutor_profile.rates
  end

  # the length of the tutoring bookings in hour
  def length
    (self.end_time - self.start_time) / 3600
  end

  # find the price of the session rounded to the nearest 0.05
  def cost
    ((self.rates * self.length) * 20).round.to_f / 20
  end

  # find tutor full name of booking
  def tutor_name
    self.tutor.first_name + " " + self.tutor.last_name
  end

  # find student full name of booking
  def student_name
    self.student.first_name + " " + self.student.last_name
  end

end
