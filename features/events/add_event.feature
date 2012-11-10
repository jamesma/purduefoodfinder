Feature: Add event
  As a user of the website
  I want to add an event
  so the event can be displayed to others

    Background:
      Given I am logged in

    Scenario: User adds event with valid data
      When I fill the event form with valid event data
      When I click create event button
      Then I should see a successful event creation message

    Scenario: User adds event with invalid data
      When I fill the event form with invalid event data
      When I click create event button
      Then I should see an invalid event creation message