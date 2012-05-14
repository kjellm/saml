Given /^an active user session$/ do
  @session = SAML::Session.new
end

When /^I send a LogoutRequest for the session$/ do
  @session.logout
end

Then /^I should receive a valid LogoutResponse$/ do
  pending # express the regexp above with the code you wish you had
end

