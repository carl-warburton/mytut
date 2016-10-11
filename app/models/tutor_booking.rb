class TutorBooking < ApplicationRecord
  after_create :assign_default_approved

  belongs_to :tutor, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :date, presence: true



  # set approved to false
  def assign_default_approved
    self.update_attribute(:approved, false)
  end

end
