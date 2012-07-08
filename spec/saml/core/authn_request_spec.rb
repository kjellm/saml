require 'spec_helper'

module SAML
  module Core
    describe AuthnRequest do

      it { should be_kind_of(RequestAbstract) }

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
            xml.get_elements('saml:Issuer').first.text.should == "me"
          end
        end
      end
    end
  end
end
