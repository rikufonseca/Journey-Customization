class BookingsController < ApplicationController

  def new
    @journey = Journey.find(params[:journey_id])
    @booking = Booking.new
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @user = User.find(params[:booking][:user_id])
    @booking = Booking.new(params_booking)
    @booking.journey = @journey
    @booking.user = @user
    @booking.save

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
