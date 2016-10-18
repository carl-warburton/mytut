class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :omniauthable, :omniauth_providers => [:facebook]
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
    first_name + " " + last_name
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.remote_avatar_url = auth.info.image.sub('http:','https:') # add image to avatar(bad quality)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.first_name = data["first_name"] if user.first_name.blank?
        user.last_name = data["last_name"] if user.last_name.blank?
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
