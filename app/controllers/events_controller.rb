class EventsController < ApplicationController
  
  def index
    @events = Event.all.sort_by(&:created_at)
    @there_is_current_user = current_user.present?
  end

  def show
    @event = Event.find(params[:id])
    @users_attending = @event.users
  end

  def sessioned_show
    @event = Event.find(params[:event_id])
    @users_attending = @event.users
    #its not good to write querying conditions in views so extract here.
    @user_is_not_attending = !(@event.user_attending_event(current_user))
    @is_not_a_past_event = @event.event_at > Date.today
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.event_at = convert_date(params[:event][:event_at])
     @event.entry_fee = (params[:event][:entry_fee]).to_i
     if @event.save
       redirect_to redirect_link_after_create, notice: 'Event was successfully created.'
     else
       render action: "new"
     end
  end

  def update
    @event = Event.find(params[:id])
    @event.attributes = params[:event]
    @event.event_at = convert_date(params[:event][:event_at])
    @event.entry_fee = (params[:event][:entry_fee]).to_i
     if @event.save
       redirect_to redirect_link_after_create, notice: 'Event was successfully upated.'
     else
       render action: "edit"
     end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def attend
    find_event_and_user
    @event.add_event_to_attending(@user)
    @user.deduct_entry_from_credit(@event)
    flash[:notice] = 'successfully attening event' 
    redirect_to events_path
  end

  def unattend
    find_event_and_user
    @event.remove_event_to_from_user(@user)
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

  def find_event_and_user
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
  end

  def convert_date(string_date)
    day = string_date.split('-').last.to_i
    month = string_date.split('-').second.to_i
    year = string_date.split('-').first.to_i
    @date = Date.new(year,month,day)
    @date
  end
end