Feature: Single Logout Profile
  In order to log out from all services
  As an user
  I wan't a single logout service

Scenario: Logout Request Issued by Session Participant to Identity Provider
  Given an established user session on the Identity Provider
    And on two Service Providers (A and B)
  When I send a Logout Request via Service Provider A
  Then my session should be gone from all three entities

