include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_header do |header|
  match do |page|
    page.should have_selector('h1', text: header)
  end
end

RSpec::Matchers.define :have_title do |title|
  match do |page|
    page.should have_selector('title', text: title)
  end
end

RSpec::Matchers.define :have_header_and_title do |header, title|
  match do |page|
    page.should have_selector('h1', text: header)
    page.should have_selector('title', text: title)
  end
end

RSpec::Matchers.define :have_link do |link|
  match do |page|
    page.should have_selector('a', text: link)
  end
end

### GIVEN ###
Given /^I am at the home page$/ do
  visit '/'
end

### WHEN ###
When /^I navigate to the page of (.*)$/ do |page|
  case page
    when 'home'
      visit '/'
    when 'login'
      click_link 'Login'
    when 'signup'
      click_link 'Sign up'
    when 'profile'
      click_link 'Profile'
    when 'settings'
      click_link 'Settings'
    when 'about'
      click_link 'About'
    when 'contact'
      click_link 'Contact'
    when 'events'
      click_link 'Events'
    when 'add event'
      click_link 'Add'
    when 'event'
      visit '/'
    when 'edit event'
      visit '/'
  end
end

When /^I navigate to a single event page$/ do
  event = Event.first
  click_link event.name
end

When /^I navigate to an edit event page of an event I own$/ do
  click_link 'edit'
end

### THEN ###
Then /^I should see the title of (.*)$/ do |title|
  page.should have_title(title)
end

Then /^I should not see the link of (.*)$/ do |link|
  page.should_not have_link(link)
end

Then /^I should see the event name title$/ do
  event = Event.first
  page.should have_title(event.name)
end