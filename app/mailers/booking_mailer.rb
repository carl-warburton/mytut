class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.received.subject
  #
  def received(booking)
    @booking = booking
    @greeting = "Hello Student"

    mail(to: @booking.student.email, subject: "Your booking request has been sent")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.response.subject
  #
  def response(booking)
    @booking = booking
    @greeting = "Hello Tutor"

    mail(to: @booking.tutor.email , subject: "A Student has requested you")
  end

  def receipt(booking)
    @booking = booking

    mail(to: @booking.student.email, subject:"Payment Receipt")
  end
end
