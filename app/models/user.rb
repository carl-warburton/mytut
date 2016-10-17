class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  rolify

  has_one :tutor_profile, dependent: :destroy
  has_one :student_profile, dependent: :destroy

  # can have many bookings as a student or a tutor
  has_many :studentbookings, class_name: "TutorBooking", foreign_key: "student_id"
  has_many :tutorbookings, class_name: "TutorBooking", foreign_key: "tutor_id"

  has_many :conversations1, class_name: "Conversation", foreign_key: "sender_id"
  has_many :conversations2, class_name: "Conversation", foreign_key: "recipient_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  def bookings
    TutorBooking.where("tutor_id = ? or student_id = ?", self.id, self.id)
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
