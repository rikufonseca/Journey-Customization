class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit destroy accept refuse]
  def new
    @journey = Journey.find(params[:journey_id])
    @booking = Booking.new
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @user = current_user
    @booking = Booking.new(params_booking)
    @booking.journey = @journey
    @booking.user = @user
    @booking.status = 'Pending'
    @booking.save!
    if @booking.save!
      redirect_to dashboard_path, notice: "You successfully booked this wonderfull jouney"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(params_booking)
    if @booking.update(params_booking)
      redirect_to journey_path(@journey), notice: 'booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: 'Booking was successfully destroyed.'
  end

  def accept
    @booking.status = 'Accepted'
    @booking.save
    redirect_to dashboard_path, notice: 'Booking accepted !'
  end

  def refuse
    @booking.status = 'refuse'
    @booking.save
    redirect_to dashboard_path, notice: 'booking refused !'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :number_of_people)
  end
end
