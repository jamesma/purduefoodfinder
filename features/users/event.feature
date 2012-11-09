Feature: Events
  As a user of the website
  I want to see the events that are available

    Scenario: Visitor looks up index of events
      Given I am not logged in
      When I click index event button
      Then I should see a list of events

    Scenario: User signs in and looks up index of events
      Given I exist as a user
        And I am not logged in
      When I sign in with valid credentials
      When I click index event button
      Then I should see a list of events