
def create_event
  @event ||= { 
    name:       "Test Event",
    details:    "Event for testing, please ignore.",
    where:      "Purdue University STEW302",
    source:     "CS Opportunity Update",
    whendate:   "01-02-2013",
    whentime:   "11:11 AM",
    category:   "Tech Talk" }
end

def create_events
  users = User.all(limit: 10)
  users.each do |user|
    name = Faker::Name.title
    details = Faker::Lorem.sentence
    address = Faker::Address.street_name
    source = Faker::Internet.url
    category = Faker::Address.state
    date = rand(5.months).ago
    time = rand(50.minutes).ago
    user.events.create!(
      name: name,
      details: details,
      where: address,
      source: source,
      category: category,
      whendate: date,
      whentime: time)
  end
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
  fill_in "Category",   with: @event[:category]
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

When /^There are events already created$/ do
  create_users
  create_events
end

Then /^I should see the home page$/ do
  page.should have_selector('title', text: "PurdueFoodFinder")
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
    page.should have_content event.where
    page.should have_content event.category
    
    user = event.user
    page.should have_content user.name
  end
end

Then /^I should see a list of events with correct date and time$/ do
  @events = Event.all
  @events.each do |event|
    formatted_date = event.whendate.strftime("%m/%d/%y")
    formatted_time = event.whentime.strftime("%I:%M %p")
    page.should have_content formatted_date
    page.should have_content formatted_time
  end
end
