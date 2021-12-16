class BookingsController < ApplicationController

  def new
  # @user = User.find(params[:user_id])
    @journey = Journey.find(params[:journey_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @journey = Journey.find(params[:booking][:journey_id])
    @booking = Booking.new(params_booking)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def accept
  end

  def refuse
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :number_of_people)
  end
end
