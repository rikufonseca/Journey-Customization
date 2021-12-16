class BookingsController < ApplicationController

  def new
    @journey = Journey.find(params[:journey_id])
    @booking = Booking.new
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @user = current_user
    @booking = Booking.new(params_booking)
    @booking.journey = @journey
    @booking.user_id = @curent_user
    @booking.save
    if @booking.save
      redirect_to dashboard_path, notice: "You successfully booked this wonderfull jouney"
    else
      render :new
    end
  end 

  def edit
    @booking = Booking.find(params[:id])
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
    redirect_to journey_path(@journey), notice: 'Booking was successfully destroyed.'
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
