require 'test_helper'

class TutorBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor_booking = tutor_bookings(:one)
  end

  test "should get index" do
    get tutor_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_booking_url
    assert_response :success
  end

  test "should create tutor_booking" do
    assert_difference('TutorBooking.count') do
      post tutor_bookings_url, params: { tutor_booking: { date: @tutor_booking.date, end_time: @tutor_booking.end_time, start_time: @tutor_booking.start_time, user_id: @tutor_booking.user_id, user_id: @tutor_booking.user_id } }
    end

    assert_redirected_to tutor_booking_url(TutorBooking.last)
  end

  test "should show tutor_booking" do
    get tutor_booking_url(@tutor_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_booking_url(@tutor_booking)
    assert_response :success
  end

  test "should update tutor_booking" do
    patch tutor_booking_url(@tutor_booking), params: { tutor_booking: { date: @tutor_booking.date, end_time: @tutor_booking.end_time, start_time: @tutor_booking.start_time, user_id: @tutor_booking.user_id, user_id: @tutor_booking.user_id } }
    assert_redirected_to tutor_booking_url(@tutor_booking)
  end

  test "should destroy tutor_booking" do
    assert_difference('TutorBooking.count', -1) do
      delete tutor_booking_url(@tutor_booking)
    end

    assert_redirected_to tutor_bookings_url
  end
end
