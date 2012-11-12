class EventsController < ApplicationController
  before_filter :authenticate_user!,    only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user_or_admin, only: [:destroy, :edit, :update]

  # Declare category options here
  @@category_options = ['Callout', 'Talk', 'Career Fair', 'Show', 'Others']

  # Return HTML form for new event creation
  def new
    @event = Event.new
    @category_options = @@category_options
  end

  # Display specific event
  def show
    @event = Event.find(params[:id])
  end

  # Display list of events
  def index
    redirect_to root_url
  end

  # Create new event
  def create
    params[:event]["whendate"] = convert_string_to_date(params[:event]["whendate"])
    params[:event]["whentime"] = convert_string_to_time(params[:event]["whentime"])
    @event = current_user.events.build(params[:event])
    if @event.save
      redirect_to root_url, notice: "Event added."
    else
      # Rails does not run any of the code for that action in the controller specified by render 'new'
      # Any instance var that is required in the view must be set up in here before calling render
      @category_options = @@category_options
      render 'new'
    end
  end

  # Return HTML form for event edit
  def edit
    @event = Event.find(params[:id])
    @category_options = @@category_options
  end

  # Update specific event
  def update
    params[:event]["whendate"] = convert_string_to_date(params[:event]["whendate"])
    params[:event]["whentime"] = convert_string_to_time(params[:event]["whentime"])
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event), notice: "Event updated."
    else
      render 'edit'
    end
  end

  # Delete specific event
  def destroy
    @event.destroy
    redirect_to user_path(current_user), notice: "Event deleted."
  end

  private

    def convert_string_to_date(string)
      unless string.empty?
        date_elements = extract_whendate_elements(string)
        Date.civil(date_elements[2], date_elements[0], date_elements[1])
      else
        nil
      end
    end

    def convert_string_to_time(string)
      unless string.empty?
        time_elements = extract_whentime_elements(string)
        hours, minutes, am_pm = time_elements

        if am_pm == "AM"
          hours -= 12 if hours == 12 # First hour of the day
        else
          hours += 12 if hours != 12
        end
        Time.new(2000,1,1, hours, minutes, 0, "+00:00")
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

    def extract_whentime_elements(whentime)
      elements = %r/(\d\d):(\d\d) (AM|PM)/.match(whentime)
      if (!elements.nil? && elements.size == 4)
        [elements[1].to_i, elements[2].to_i, elements[3]]
      else
        nil
      end
    end

    def correct_user_or_admin
      if current_user.has_role? :admin
        @event = Event.find_by_id(params[:id])
      else
        @event = current_user.events.find_by_id(params[:id])
      end
      redirect_to root_url if @event.nil?
    end

end
