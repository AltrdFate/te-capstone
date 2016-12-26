Feature: Go to sign up page

	Scenario: Go to create account from login page
		Given I am a new user without a profile
		When I click on the sign up button
		Then I will be taken to the sign up page