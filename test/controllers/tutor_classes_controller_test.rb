require 'test_helper'

class TutorClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor_class = tutor_classes(:one)
  end

  test "should get index" do
    get tutor_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_class_url
    assert_response :success
  end

  test "should create tutor_class" do
    assert_difference('TutorClass.count') do
      post tutor_classes_url, params: { tutor_class: { name: @tutor_class.name, password_digest: @tutor_class.password_digest, tutor_booking_id: @tutor_class.tutor_booking_id } }
    end

    assert_redirected_to tutor_class_url(TutorClass.last)
  end

  test "should show tutor_class" do
    get tutor_class_url(@tutor_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_class_url(@tutor_class)
    assert_response :success
  end

  test "should update tutor_class" do
    patch tutor_class_url(@tutor_class), params: { tutor_class: { name: @tutor_class.name, password_digest: @tutor_class.password_digest, tutor_booking_id: @tutor_class.tutor_booking_id } }
    assert_redirected_to tutor_class_url(@tutor_class)
  end

  test "should destroy tutor_class" do
    assert_difference('TutorClass.count', -1) do
      delete tutor_class_url(@tutor_class)
    end

    assert_redirected_to tutor_classes_url
  end
end
