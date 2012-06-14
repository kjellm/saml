# AuthnRequest
# 
# SAML v2.0 Core
# 
# Section 3.4.1
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require 'spec_helper'

module SAML
  module Core
    describe AuthnRequest do

      it "should extend RequestAbstract" do
        AuthnRequest.new.should be_kind_of(RequestAbstract)
      end

      describe "#to_xml" do
        context "attributes" do
          subject { AuthnRequest.new.to_xml.root.attributes }
          it { should include('Version') }
          it { should include('ID') }
          it { should include('IssueInstant') }
        end

        context "with Issuer" do
          it "should have an Issuer element in the xml" do
            r = AuthnRequest.new
            r.issuer = "me"
            xml = r.to_xml.root
            puts xml.to_s
            xml.get_elements('saml:Issuer').first.text.should == "me"
          end
        end
      end
    end
  end
end
