class PagesController < ApplicationController
  def home
  end

  def tutors
    @tutor_profiles = TutorProfile.all
  end
end
