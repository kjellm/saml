# HTTP Redirect Binding
# 
# SAML v2.0 Bindings
# 
# Section 3.4
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-bindings-2.0-os.pdf
#

require 'spec_helper'

module SAML
  module Bindings
    describe HTTPRedirect do

      let :endpoint do
        endpoint = double('Endpoint')
        endpoint.stub(:location).and_return('')
        endpoint
      end
        
      let(:http) { double('HTTP') }

      describe "#send_request" do
        it "should base64 and url encode the SAMLRequest query parameter" do
          sr = Core::AuthnRequest.new
          http.should_receive(:redirect).with(/\?SAMLRequest=[A-za-z0-9%]+/)

          subject.send_request(http, endpoint, sr)
        end
      
        context "with relay_state parameter" do
          let(:saml_request) { double('SAMLRequest').as_null_object }

          it "should accept a relay_state and URL encode it" do
            http.should_receive(:redirect).with(/RelayState=A\+relay\+state/)
            subject.send_request(http, endpoint, saml_request, 'A relay state')
          end

          it "should not accept relay_state longer than 80 bytes" do
            expect {
              subject.send_request(http, endpoint, saml_request, 'x'*81)
            }.to raise_error(ArgumentError)
          end
        end
      end
    end
  end
end
