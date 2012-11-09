Feature: Add event
  As a visitor of the website
  I want to add an event
  so the event can be displayed to others

    Background:
      Given I am not logged in

    Scenario: Visitor clicks add event button
      When I click add event button
      Then I should see a require login message