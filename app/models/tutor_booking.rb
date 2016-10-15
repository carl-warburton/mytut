class TutorBooking < ApplicationRecord

  belongs_to :tutor, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :date, presence: true

  # the rate in $/hr of the booking
  def rates
    tutor.tutor_profile.rates
  end

  # the length of the tutoring bookings in hour
  def length
    (end_time - start_time) / 3600
  end

  # find the price of the session rounded to the nearest 0.05
  def cost
    ((rates * length) * 20).round.to_f / 20
  end

  # find tutor full name of booking
  def tutor_name
    tutor.first_name + " " + tutor.last_name
  end

  # find student full name of booking
  def student_name
    student.first_name + " " + student.last_name
  end

  def date_time
    date.strftime("%d %B %y")
  end

  def start
    start_time.strftime('%H:%M')
  end

  def end
    end_time.strftime("%H:%M")
  end
end
