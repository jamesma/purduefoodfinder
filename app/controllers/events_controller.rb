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
    if (!params[:event]["whendate"].empty?)
      date_elements = extract_whendate_elements(params[:event]["whendate"])
      params[:event]["whendate"] = Date.civil(date_elements[2], date_elements[0], date_elements[1])
    end
    @event = current_user.events.build(params[:event])
    if @event.save
      redirect_to root_url, notice: "Event added."
    else
      render 'new'
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

  private

    def extract_whentime_elements(whentime)
      elements = %r/(\d\d):(\d\d) (AM|PM)/.match(whentime)
      if (!elements.nil? && elements.size == 4)
        [elements[1].to_i, elements[2].to_i, elements[3]]
      else
        nil
      end
    end

    def extract_whendate_elements(whendate)
      elements = %r/(\d\d)-(\d\d)-(\d\d\d\d)/.match(whendate)
      if (!elements.nil? && elements.size == 4)
        [elements[1].to_i, elements[2].to_i, elements[3].to_i]
      else
        nil
      end
    end

    def merge_whentime_and_whendate(whentime, whendate)
      time_elements = extract_whentime_elements(whentime)
      hours, minutes, am_pm = time_elements

      if am_pm == "AM"
        hours -= 12 if hours == 12 # First hour of the day
      else
        hours += 12 if hours != 12
      end

      month, day, year = extract_whendate_elements(whendate)
      seconds = 0
      timezone = "-05:00"

      DateTime.new(year, month, day, hours, minutes, seconds)
    end

end
