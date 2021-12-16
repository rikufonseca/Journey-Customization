class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

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
    @journey.user_id = current_user
    @journey.save
    if @journey.save!
      redirect_to journey_path(@journey)
    else
      render :new
    end
  end

  # GET /journeys/:id/edit
  def edit
  end

  # PATCH /journeys/:id
  def update
    @journey.update(journey_params)
    if @journey.update(journey_params)
      redirect_to journey_path(@journey), notice: 'Journey was successfully updated.'
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
    params.require(:journey).permit(:title, :photo, :address, :duration, :price, :exterior, :popularity, :anecdote,
                                    :sense, :environment, interest_list: [])
  end
end
