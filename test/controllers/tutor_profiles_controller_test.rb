require 'test_helper'

class TutorProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor_profile = tutor_profiles(:one)
  end

  test "should get index" do
    get tutor_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_profile_url
    assert_response :success
  end

  test "should create tutor_profile" do
    assert_difference('TutorProfile.count') do
      post tutor_profiles_url, params: { tutor_profile: { description: @tutor_profile.description, experience: @tutor_profile.experience, qualifications: @tutor_profile.qualifications, rates: @tutor_profile.rates, subject: @tutor_profile.subject, subject_year: @tutor_profile.subject_year, user_id: @tutor_profile.user_id } }
    end

    assert_redirected_to tutor_profile_url(TutorProfile.last)
  end

  test "should show tutor_profile" do
    get tutor_profile_url(@tutor_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_profile_url(@tutor_profile)
    assert_response :success
  end

  test "should update tutor_profile" do
    patch tutor_profile_url(@tutor_profile), params: { tutor_profile: { description: @tutor_profile.description, experience: @tutor_profile.experience, qualifications: @tutor_profile.qualifications, rates: @tutor_profile.rates, subject: @tutor_profile.subject, subject_year: @tutor_profile.subject_year, user_id: @tutor_profile.user_id } }
    assert_redirected_to tutor_profile_url(@tutor_profile)
  end

  test "should destroy tutor_profile" do
    assert_difference('TutorProfile.count', -1) do
      delete tutor_profile_url(@tutor_profile)
    end

    assert_redirected_to tutor_profiles_url
  end
end
