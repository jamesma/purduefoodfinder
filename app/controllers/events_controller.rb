class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # Return HTML form for new event creation
  def new
    @event = Event.new
  end

  # Display specific event
  def show
    @event = Event.find(params[:id])
  end

  # Display list of events
  def index
    @events = Event.all
  end

  # Create new event
  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      redirect_to root_url, notice: "Event added."
    else
      redirect_to root_url, alert: "An error occurred. Unable to add event."
    end
  end

  # Return HTML form for event edit
  def edit

  end

  # Update specific event
  def update

  end

  # Delete specific event
  def destroy

  end

end
