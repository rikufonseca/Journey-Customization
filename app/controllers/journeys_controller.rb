class JourneysController < ApplicationController

  before_action :set_journey, only: %i[show edit update destroy]

  def index
    @journeys = Journey.all
  end

  def show
  end

  def new
    @journey = journey.new
  end

  def create
    @journey = journey.new(journey_params)
    @journey.user_id = @curent_user
    @journey.save
    
    redirect_to journeys_path
  end

  private

  def journey_params
    params.require(:journey).permit(:address, :duration, :price, :exterior, :interest, :sense, :popularity, :anecdote, :environment)
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
end

private

def set_journey
  @journey = Journey.find(params[:id])
end
