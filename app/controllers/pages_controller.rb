class PagesController < ApplicationController
  before_action :require_login, only: [:bookings, :approval]
  before_action :require_tutor, only: [:approval]
  # search tutors by name
  def search
    if params[:search]
      @search = params[:search]
      @users = User.with_role(:tutor)
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{@search[:name]}%", "%#{@search[:name]}%" )
      @search1 = @users.map {|user| user.tutor_profile }
      @search2 = TutorProfile.where("subject ILIKE ?", "%#{@search[:subject]}%")
      @search3 = TutorProfile.where("subject_year ILIKE ?", "%#{@search[:subject_year]}%")
      @tutor_profiles = @search1 & @search2 & @search3
    else
      @tutor_profiles = []
    end
    render 'tutors'
  end

  def tutors
    @tutor_profiles = TutorProfile.all
  end

  def requests
    # find all the bookings mades by the current user(student)
    @studentbookings = TutorBooking.where(student_id: current_user.id)
    # find all the bookings request to the current_user (tutor)
    @tutorbookings = TutorBooking.where(tutor_id: current_user.id)
  end

  def approval
    if @tutor_booking.approved
      @tutor_booking.update_attribute(:approved, false)
    else
      @tutor_booking.update_attribute(:approved, true)
    end
    redirect_to bookings_url
  end

  def bookings
  end

  def home
  end

  private

  def require_login
    unless current_user
      flash[:alert] = "You must be logged in to access this section"
      redirect_to new_user_session_url
    end
  end

  def require_tutor
    @tutor_booking = TutorBooking.find(params[:booking])
    if @tutor_booking.tutor.id != current_user.id
      flash[:alert] = "You are not allowed to perform this action"
      redirect_to root_path
    end
  end

end
