require 'spec_helper'

module SAML
  describe Session do
    describe "#logout_participants" do

      it do
        providers = [double('ServiceProvider A'), double('ServiceProvider B')]
        providers.each {|p| p.should_receive(:logout) }

        s = Session.new(1)
        providers.each {|p| s.add_participant(p) }
        s.logout_participants
      end

    end
  end
end


