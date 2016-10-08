class TutorProfilesController < ApplicationController
  before_action :require_login, except: [:search]
  before_action :set_tutor_profile, only: [:show, :edit, :update, :destroy]
  before_action :check_profile_presence, only: [:new, :create]


  def search
    if params[:search]
      @search = params[:search]
      @users = User.with_role(:tutor)
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{@search[:search]}%", "%#{@search[:search]}%" )
      @tutor_profiles = @users.map {|user| user.tutor_profile }
    else
      @tutor_profiles = []
    end
  end

  def filter
    if params[:filter]
      @search = params[:filter]
      @search1 = TutorProfile.where("subject ILIKE ?", "%#{@search[:subject]}%")
      @search2 = TutorProfile.where("subject_year ILIKE ?", "%#{@search[:subject_year]}%")
      @tutor_profiles = @search1 & @search2
    else
      @tutor_profiles = []
    end
    render 'search'
  end
  # GET /tutor_profiles
  # GET /tutor_profiles.json
  def index
    @tutor_profiles = TutorProfile.all
  end

  # GET /tutor_profiles/1
  # GET /tutor_profiles/1.json
  def show
  end

  # GET /tutor_profiles/new
  def new
    @tutor_profile = TutorProfile.new
  end

  # GET /tutor_profiles/1/edit
  def edit
  end

  # POST /tutor_profiles
  # POST /tutor_profiles.json
  def create
    @tutor_profile = TutorProfile.new(tutor_profile_params)
    @tutor_profile.user_id = current_user.id

    respond_to do |format|
      if @tutor_profile.save
        format.html { redirect_to @tutor_profile, notice: 'Tutor profile was successfully created.' }
        format.json { render :show, status: :created, location: @tutor_profile }
      else
        format.html { render :new }
        format.json { render json: @tutor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_profiles/1
  # PATCH/PUT /tutor_profiles/1.json
  def update
    respond_to do |format|
      if @tutor_profile.update(tutor_profile_params)
        format.html { redirect_to @tutor_profile, notice: 'Tutor profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor_profile }
      else
        format.html { render :edit }
        format.json { render json: @tutor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_profiles/1
  # DELETE /tutor_profiles/1.json
  def destroy
    @tutor_profile.destroy
    respond_to do |format|
      format.html { redirect_to tutor_profiles_url, notice: 'Tutor profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_profile
      @tutor_profile = TutorProfile.find(params[:id])
    end

    # if not logged in the user is redirected to the log in page
    def require_login
      unless user_signed_in?
        # respond_to do |format|
        #   format.html { redirect_to new_user_session_url, notice: 'Tutor profile was successfully destroyed.' }
        #   format.json { head :no_content }
        # end
        flash[:info] = "You must be logged in to access this section"
        redirect_to new_user_session_url
      end
    end

    # a user can not create more that one profile
    def check_profile_presence
      redirect_to tutor_profile_url(current_user) if current_user.tutor_profile
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_profile_params
      params.require(:tutor_profile).permit(:description, :subject, :subject_year, :rates, :experience, :qualifications, :user_id)
    end
end
