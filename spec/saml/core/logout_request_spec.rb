require 'spec_helper'

module SAML
  module Core
    describe LogoutRequest do

      it { should be_kind_of(RequestAbstract) }

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
