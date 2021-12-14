class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
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
