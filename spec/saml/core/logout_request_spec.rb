# LogoutRequest
# 
# SAML v2.0 Core
# 
# Section 3.7.1
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require 'spec_helper'

module SAML
  module Core
    describe LogoutRequest do

      it "should extend RequestAbstract" do
        AuthnRequest.new.should be_kind_of(RequestAbstract)
      end

#%w(Subject NameIDPolicy Conditions RequestedAuthnContext Scoping ForceAuthn IsPassive AssertionConsumerServiceIndex AssertionConsumerServiceURL ProtocolBinding AttributeConsumingServiceIndex ProviderName).each do |attr|
#  it "should not support optional attribute/element #{attr}"
#end
#
#describe "#to_xml" do
#  it "should have a root element with no child elements" do
#    xml = AuthnRequest.new.to_xml
#    xml.root.elements.should be_empty
#  end
#
#  context "attributes" do
#    subject { AuthnRequest.new.to_xml.root.attributes }
#    it { should have(4).items }
#    it { should include('Version') }
#    it { should include('ID') }
#    it { should include('IssueInstant') }
#  end
#end
    end
  end
end
