class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit update destroy]

  def index
    @journeys = Journey.all
  end

  def show
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user_id = @curent_user
    @journey.save

    redirect_to journeys_path
  end


  # GET /journeys/:id/edit
  def edit
  end

  # PATCH /journeys/:id
  def update
    if @journey.update(garden_params)
      redirect_to journeys_path, notice: 'Garden was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @journey.destroy
    redirect_to journeys_path, notice: 'Journey was successfully destroyed.'
  end

  private

  def set_journey
    @journey = Journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:address, :duration, :price, :exterior, :popularity, :anecdote, :interest => [], :sense => [], :environment => [])
  end
end
