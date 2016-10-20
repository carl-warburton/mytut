class TutorClassesController < ApplicationController
  before_action :set_tutor_class, only: [:show, :edit, :update, :destroy]

  # GET /tutor_classes
  # GET /tutor_classes.json
  def index
    @tutor_classes = TutorClass.all
  end

  # GET /tutor_classes/1
  # GET /tutor_classes/1.json
  def show
  end

  # GET /tutor_classes/new
  def new
    @tutor_class = TutorClass.new
  end

  # GET /tutor_classes/1/edit
  def edit
  end

  # POST /tutor_classes
  # POST /tutor_classes.json
  def create
    @tutor_class = TutorClass.new(tutor_class_params)

    respond_to do |format|
      if @tutor_class.save
        format.html { redirect_to @tutor_class, notice: 'Tutor class was successfully created.' }
        format.json { render :show, status: :created, location: @tutor_class }
      else
        format.html { render :new }
        format.json { render json: @tutor_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_classes/1
  # PATCH/PUT /tutor_classes/1.json
  def update
    respond_to do |format|
      if @tutor_class.update(tutor_class_params)
        format.html { redirect_to @tutor_class, notice: 'Tutor class was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor_class }
      else
        format.html { render :edit }
        format.json { render json: @tutor_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_classes/1
  # DELETE /tutor_classes/1.json
  def destroy
    @tutor_class.destroy
    respond_to do |format|
      format.html { redirect_to tutor_classes_url, notice: 'Tutor class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_class
      @tutor_class = TutorClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_class_params
      params.require(:tutor_class).permit(:name, :password, :password_confirmation, :tutor_booking_id)
    end
end
