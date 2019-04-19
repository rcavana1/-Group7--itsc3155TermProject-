Feature: Create a new account
  As a user
  So that I can create monthly budgets and save them for later
  I want to be able to create a new account

Scenario: As a user I want to be able to navigate from the homepage to the create account form
  Given I am on the home page
  When I click on the "Create an account" link
  Then I should be on the "New Account" page
  And I should see the "Username" field
  And I should see the "Password" field
  And I should see the "Name" field