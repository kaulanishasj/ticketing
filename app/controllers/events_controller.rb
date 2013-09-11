class EventsController < ApplicationController
  
  def index
    @events = Event.all.sort_by(&:created_at)
  end

  def show
    @event = Event.find(params[:id])
    @users_attending = @event.users
  end

  def sessioned_show
    @event = Event.find(params[:event_id])
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
     if @event.save
       redirect_to redirect_link_after_create, notice: 'Event was successfully created.'
     else
       render action: "new"
     end
  end

  def update
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def attend
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    event.add_event_to_attending(user)
    flash[:notice] = 'successfully attening event' 
    redirect_to events_path
  end

  def unattend
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    event.remove_event_to_from_user(user)
    flash[:notice] = 'successfully unattening event' 
    redirect_to events_path
  end

  private

  def redirect_link_after_create
    if current_user.present?
      event_sessioned_show_path(@event)
    else
      event_path(@event)
    end
  end

end