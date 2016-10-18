class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:bookings, :approval, :bookings ]
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
      flash[:danger]= "Request has been disapproved"
      @tutor_booking.update(approved: false)
    else
      flash[:success]= "Request has been approved"
      @tutor_booking.update(approved: true, paid: false)
    end
    redirect_to requests_url
  end

  def bookings
    # find all the bookings that are approved mades by the current user( as a student)
    @studentbookings = TutorBooking.where(student_id: current_user.id, approved: true).order(:date)
    # find all the approved request bookings to the current_user (as a tutor)
    @tutorbookings = TutorBooking.where(tutor_id: current_user.id, approved: true).order(:date)
  end

  def home
  end

  private

  def require_tutor
    @tutor_booking = TutorBooking.find(params[:booking])
    if @tutor_booking.tutor.id != current_user.id
      flash[:alert] = "You are not allowed to perform this action"
      redirect_to root_path
    end
  end

end
