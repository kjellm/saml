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

      describe "#to_xml" do
        subject do
          r = LogoutRequest.new
          r.name_id = "test@example.com"
          r.to_xml.root
        end
        
        it { should have(1).elements }
        its(:name) { should == "LogoutRequest" } 
      end
    end
  end
end
