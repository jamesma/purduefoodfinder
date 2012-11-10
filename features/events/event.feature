Feature: Events
  As a user of the website
  I want to see the events that are available

    Scenario: Visitor looks up index of events
      Given I am not logged in
      When There are events already created
      When I click index event button
      Then I should see a list of events
      And I should see a list of events with correct date and time

    Scenario: User signs in and looks up index of events
      Given I exist as a user
        And I am not logged in
      When I sign in with valid credentials
      When There are events already created
      When I click index event button
      Then I should see the home page
      Then I should see a list of events
      And I should see a list of events with correct date and time