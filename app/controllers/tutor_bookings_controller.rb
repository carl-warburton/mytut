class TutorBookingsController < ApplicationController
  load_and_authorize_resource param_method: :tutor_booking_params
  before_action :authenticate_user!, :require_student, :require_profile
  before_action :set_tutor_booking, only: [:show, :edit]


  # GET /tutor_bookings
  # GET /tutor_bookings.json
  def index
    @tutor_bookings = TutorBooking.all
  end

  # GET /tutor_bookings/1
  # GET /tutor_bookings/1.json
  def show
  end

  # GET /tutor_bookings/new
  def new
    @tutor_booking = TutorBooking.new
  end

  # GET /tutor_bookings/1/edit
  def edit
  end

  # POST /tutor_bookings
  # POST /tutor_bookings.json
  def create
    @tutor_booking = TutorBooking.new(tutor_booking_params)
    @tutor_booking.student_id = current_user.id
    respond_to do |format|
      if @tutor_booking.save
        format.html { redirect_to requests_path, notice: 'Tutor request has been sent.' }
        format.json { render :show, status: :created, location: @tutor_booking }
      else
        format.html { redirect_to :back, notice: 'Date or Time are wrong.' }
        format.json { render json: @tutor_booking.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_booking
      @tutor_booking = TutorBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_booking_params
      params.require(:tutor_booking).permit(:student_id, :tutor_id, :date, :start_time, :end_time)
    end

    def require_student
      unless current_user.has_role? :student
        flash[:alert] = "You must be a student to request a booking."
        redirect_to tutors_path
      end
    end

    def require_profile
      unless current_user.student_profile
        flash[:alert] = "You must create a student profile first."
        redirect_to new_student_profile_url
      end
    end
end
