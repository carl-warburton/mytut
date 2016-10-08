class PagesController < ApplicationController

  # search tutors by name
  def search
    if params[:search]
      @search = params[:search]
      @users = User.with_role(:tutor)
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{@search[:search]}%", "%#{@search[:search]}%" )
      @tutor_profiles = @users.map {|user| user.tutor_profile }
    else
      @tutor_profiles = []
    end
    render 'tutors'
  end

  # search tutors by subject and subject year
  def filter
    if params[:filter]
      @search = params[:filter]
      @search1 = TutorProfile.where("subject ILIKE ?", "%#{@search[:subject]}%")
      @search2 = TutorProfile.where("subject_year ILIKE ?", "%#{@search[:subject_year]}%")
      @tutor_profiles = @search1 & @search2
    else
      @tutor_profiles = []
    end
    render 'tutors'
  end

  def tutors
  end

  def home
  end

end
