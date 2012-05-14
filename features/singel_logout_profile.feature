Feature: Single Logout Profile
  In order to foo
  As a bar
  I wan't baz

Scenario: LogoutRequest Issued by Session Participant to Identity Provider
  Given an active user session
  When I send a LogoutRequest for the session
  Then I should receive a valid LogoutResponse

