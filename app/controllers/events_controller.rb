class EventsController < ApplicationController
  before_action :move_to_root, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      flash.now[:alert] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end

  private
  def event_params
    params.require(:event).permit(:date, :start_time, :finish_time, :location)
  end

  def move_to_root
    unless session[:authenticated]
      redirect_to root_path
    end
  end
  
end
