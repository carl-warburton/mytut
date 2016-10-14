class TutorBookingsController < ApplicationController
  before_action :authenticate_user!, :require_student
  before_action :set_tutor_booking, only: [:show, :edit, :update, :destroy]


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
        format.html { redirect_to @tutor_booking, notice: 'Tutor booking was successfully created.' }
        format.json { render :show, status: :created, location: @tutor_booking }
      else
        format.html { render :new }
        format.json { render json: @tutor_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_bookings/1
  # PATCH/PUT /tutor_bookings/1.json
  def update
    respond_to do |format|
      if @tutor_booking.update(tutor_booking_params)
        format.html { redirect_to @tutor_booking, notice: 'Tutor booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor_booking }
      else
        format.html { render :edit }
        format.json { render json: @tutor_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_bookings/1
  # DELETE /tutor_bookings/1.json
  def destroy
    @tutor_booking.destroy
    respond_to do |format|
      format.html { redirect_to tutor_bookings_url, notice: 'Tutor booking was successfully destroyed.' }
      format.json { head :no_content }
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
        redirect_to :back
      end
    end
end
