class EventsController < ApplicationController
  before_action :basic_auth, only: [:new, :create, :destroy]

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

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
  
end
