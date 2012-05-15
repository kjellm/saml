require 'spec_helper'

module SAML
  describe IdentityProvider do
    describe "#register_session" do
      it "should compile" do
        ip = IdentityProvider.new
        session = Session.new(1)
        ip.register_session(session)
      end
    end

    describe "#session_exists?" do
      it "should return false when there are no sessions" do
        IdentityProvider.new.session_exists?(1).should be_false
      end
    end
  end
end
