Given /^an active user session$/ do
  SAML::Session.new
end

When /^I send a LogoutRequest for the session$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should receive a valid LogoutResponse$/ do
  pending # express the regexp above with the code you wish you had
end

