Feature: Add event
  As a user of the website
  I should see the correct title for each page

    Background:
      Given I am logged in

    Scenario Outline: User navigation to a page
      When I navigate to the page of <page>
      Then I should see the title of <title>

    Examples:
      | page        | title                         |
      | home        | PurdueFoodFinder              |
      | profile     | PurdueFoodFinder Profile      |
      | settings    | PurdueFoodFinder Settings     |
      | about       | PurdueFoodFinder About        |
      | contact     | PurdueFoodFinder Contact      |
      | events      | PurdueFoodFinder              |
      | add event   | PurdueFoodFinder Add Event    |

    Scenario Outline: User finds links to other pages
      Given There are events already created
      Given I am at the home page
      Then I should not see the link of <link>

    Examples:
      | link       |
      | Login      |
      | Sign up    |

    Scenario: User navigation to an event page
      Given There are events already created
      Given I am at the home page
      When I navigate to a single event page
      Then I should see the event name title

    Scenario: User navigation to an edit event page
      Given There are events already created
      Given I am at the home page
      When I navigate to an edit event page of an event I own
      Then I should see the event name title