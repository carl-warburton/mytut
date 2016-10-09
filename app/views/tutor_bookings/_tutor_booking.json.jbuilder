json.extract! tutor_booking, :id, :tutor_profile_id, :student_profile_id, :date, :start_time, :end_time, :approved, :created_at, :updated_at
json.url tutor_booking_url(tutor_booking, format: :json)