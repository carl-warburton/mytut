class ChargesController < ApplicationController
  def new
    @booking = TutorBooking.find(params[:booking])
  end

  def create
    @booking = TutorBooking.find(params[:booking_id])
    # Amount in cents
    @amount = params[:stripeAmount]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Mytut customer',
      :currency    => 'aud'
    )

    BookingMailer.receipt(@booking).deliver_now
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    flash[:notice] = "Please try again"
  end

end
