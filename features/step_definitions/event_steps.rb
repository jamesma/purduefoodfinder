
def create_event
  @event ||= { 
    name: "Test Event",
    details: "Event for testing, please ignore.",
    where: "Purdue University STEW302",
    source: "CS Opportunity Update",
    whendate: "2012-11-08",
    whentime: "2012-11-08 22:39:03" }
end

def delete_event
  @event.destroy unless @event.nil?
end

def fill_event
  visit '/events/new'
  fill_in "Name",       with: @event[:name]
  fill_in "Details",    with: @event[:details]
  fill_in "Where",      with: @event[:where]
  fill_in "Source",     with: @event[:source]
  fill_in "Date",       with: @event[:whendate]
  fill_in "Time",       with: @event[:whentime]
end

def click_create_button
  click_button "Create Event"
end

def click_add_link
  click_link "Add"
end

def click_index_link
  click_link "Events"
end

When /^I fill the event form with valid event data$/ do
  create_event
  fill_event
end

When /^I fill the event form with invalid event data$/ do
  create_event
  @event.merge!(name: "")
  fill_event
end

When /^I click create event button$/ do
  click_create_button
end

When /^I click add event button$/ do
  click_add_link
end

When /^I click index event button$/ do
  click_index_link
end

Then /^I should see a require login message$/ do
  page.should have_content "You need to sign in or sign up before continuing."
end

Then /^I should see a successful event creation message$/ do
  page.should have_content "Event added."
end

Then /^I should see an invalid event creation message$/ do
  page.should have_content "An error occurred. Unable to add event."
end

Then /^I should see a list of events$/ do
  @events = Event.all
  @events.each do |event|
    page.should have_content event.name
  end
end
