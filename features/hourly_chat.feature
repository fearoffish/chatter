Feature: I can see an hourly summary of messages

Background:
  Given the app is running
    And I am on the All Chat screen

Scenario: I can see hourly summary messages
  When I press the "Hourly" tabBarButton
  Then I can see hourly summaries of events