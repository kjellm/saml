Given /^an established user session on the Identity Provider$/ do
  @id = 1
  @session = SAML::Session.new(@id)
  @idp    = SAML::IdentityProvider.new
  @idp.register_session(@session)
end

###

Given /^on two Service Providers \(A and B\)$/ do
  @sp_a   = SAML::ServiceProvider.new(@idp)
  @sp_b   = SAML::ServiceProvider.new(@idp)

  @session.add_participant(@sp_a)
  @session.add_participant(@sp_b)

  @sp_a.register_session(@session)
  @sp_b.register_session(@session)
end

When /^I send a Logout Request via Service Provider A$/ do
  @sp_a.logout(@id)
end

Then /^my session should be gone from all three entities$/ do
  @sp_a.session_exists?(@id).should be_false
  @sp_b.session_exists?(@id).should be_false
  @idp.session_exists?(@id).should be_false
end

###

When /^a Service Provider sends a Login Request to the Identity Provider$/ do
  @sp = SAML::ServiceProvider.new(@idp)
  @user = @sp.login
end

Then /^a session should be initialized without the user needing to supply a password$/ do
  @sp.session_exists?(@user.session_id).should be_true
end

