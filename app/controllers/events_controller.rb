class EventsController < ApplicationController
  
  def index
    @events = Event.all.sort_by(&:created_at)
  end

  def show
    @event = Event.find(params[:id])
    @users_attending = @event.users
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
  end

  def update
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end
end
