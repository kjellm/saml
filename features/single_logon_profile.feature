Feature: Single Logon Profile
  In order to minimize need for supplying username and password when using different services
  As an user
  I wan't a single logon service

Scenario: Logon Request Issued on behalf of a user with a session already running on the Identity Provider
  Given an established user session on the Identity Provider
  When a Service Provider sends a Login Request to the Identity Provider
  Then a session should be initialized without the user needing to supply a password

