class PagesController < ApplicationController
  before_action :require_login, only: [:desktop]
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

  def desktop
    # find all the bookings mades by the current user(student)
    @studentbookings = TutorBooking.where(student_id: current_user.id)
    # find all the studentbookings that are not approved
    @studentbookings_not_approved = @studentbookings.where(approved: false)
    # all studentbookings that are approved
    @studentbookings_approved = @studentbookings - @studentbookings_not_approved

    # find all the bookings request to the current_user (tutor)
    @tutorbookings = TutorBooking.where(tutor_id: current_user.id)
    # find all the bookings that are not approved
    @tutorbookings_not_approved = @tutorbookings.where(approved: false)
    # all the bookings that are approved
    @tutorbookings_approved = @tutorbookings - @tutorbookings_not_approved
    
  end

  def approval
    @tutor_booking = TutorBooking.find(params[:booking])
    if @tutor_booking.approved
      @tutor_booking.update_attribute(:approved, false)
    else
      @tutor_booking.update_attribute(:approved, true)
    end
    redirect_to desktop_url
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

end
