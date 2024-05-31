class MembersController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def create
  end

  def list
  end
end