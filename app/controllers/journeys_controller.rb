class JourneysController < ApplicationController

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
end
