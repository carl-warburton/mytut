json.extract! tutor_class, :id, :name, :password_digest, :tutor_booking_id, :created_at, :updated_at
json.url tutor_class_url(tutor_class, format: :json)