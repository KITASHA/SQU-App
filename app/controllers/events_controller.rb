class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to members_path, notice: 'イベントが更新されました'
    else
      render :edit
    end
  end


  def destroy
  end

  def list
  end

  
  private

  def event_params
    params.require(:event).permit(:date, :start_time, :location)
  end
end

