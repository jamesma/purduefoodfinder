Feature: Add event
  As a visitor of the website
  I should see the correct title for each page

    Background:
      Given I am not logged in

    Scenario Outline: Visitor navigation to a page
      When I navigate to the page of <page>
      Then I should see the title of <title>

    Examples:
      | page                | title                                 |
      | home                | PurdueFoodFinder                      |
      | about               | PurdueFoodFinder About                |
      | events              | PurdueFoodFinder                      |
      | login               | PurdueFoodFinder Login                |
      | signup              | PurdueFoodFinder Sign up              |
      | passwordreset       | PurdueFoodFinder Password Reset       |
      | resendconfirmation  | PurdueFoodFinder Resend Confirmation  |

    Scenario Outline: Visitor finds links to other pages
      Given There are events already created
      Given I am at the home page
      Then I should not see the link of <link>

    Examples:
      | link       |
      | Settings   |
      | Profile    |
      | Admin      |
      | Logout     |
      | edit       |
      | delete     |

    Scenario: User navigation to an event page
      Given There are events already created
      Given I am at the home page
      When I navigate to a single event page
      Then I should see the event name title