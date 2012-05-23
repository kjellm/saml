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

      let(:location) { '' }

      describe "#build_request_url" do
        it "should base64 and url encode the SAMLRequest query parameter" do
          xml = Core::AuthnRequest.new.to_xml
          subject.build_request_url(location, xml).should =~ /\?SAMLRequest=[A-za-z0-9%]+/
        end
      
        context "with relay_state parameter" do
          let(:xml) { double('XMLDocument').as_null_object }

          it "should accept a relay_state and URL encode it" do
            request = subject.build_request_url(@location, xml, 'A relay state')
            request.should =~ /RelayState=A\+relay\+state/
          end

          it "should not accept relay_state longer than 80 bytes" do
            expect {
              subject.build_request_url(@location, xml, 'x'*81)
            }.to raise_error(ArgumentError)
          end
        end
      end
    end
  end
end
