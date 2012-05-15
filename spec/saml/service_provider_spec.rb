require 'spec_helper'

module SAML
  describe ServiceProvider do
    before(:each) do
      @ip = IdentityProvider.new
      @sp = ServiceProvider.new(@ip)
    end

    describe '#logout' do
      it do
        s = Session.new(1)
        @ip.register_session(s)
        @sp.register_session(s)
        @sp.logout(1)
        @sp.session_exists?(1).should be_false
      end
    end

    describe '#sesssion_exists?' do
      it "should return false when there are no sessions" do
        @sp.session_exists?(1).should be_false
      end
    end

    describe '#login' do
      it do
        @sp.login
      end
    end
  end
end
