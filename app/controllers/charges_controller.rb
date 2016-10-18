class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, :require_same_id

  def new
  end

  def create
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
    @booking.update_attribute(:paid, true)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    flash[:notice] = "Please try again"
  end

  private
    def set_booking
      @booking = TutorBooking.find(params[:booking])
    end

    def require_same_id
      if current_user.id != @booking.student.id
        flash[:danger]= "You are not allowed to access this page."
        redirect_to root_path
      end
    end
end
