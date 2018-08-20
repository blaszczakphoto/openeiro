class DoorsEventsController < ApplicationController
  before_action :set_doors_event, only: [:show, :update, :destroy]

  # GET /doors_events
  def index
    @doors_events = DoorsEvent.all

    render json: @doors_events
  end

  # GET /doors_events/1
  def show
    render json: @doors_event
  end

  # POST /doors_events
  def create
    @doors_event = DoorsEvent.new(doors_event_params)

    if @doors_event.save
      render json: @doors_event, status: :created, location: @doors_event
    else
      render json: @doors_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doors_events/1
  def update
    if @doors_event.update(doors_event_params)
      render json: @doors_event
    else
      render json: @doors_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doors_events/1
  def destroy
    @doors_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doors_event
      @doors_event = DoorsEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doors_event_params
      params.require(:doors_event).permit(:state)
    end
end
