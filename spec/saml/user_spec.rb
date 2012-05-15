require 'spec_helper'

module SAML
  describe User do
    describe '#session_id' do
      it do
        User.new.session_id
      end
    end
  end
end
