require 'spec_helper'

module SAML
  module Core
    describe RequestAbstract do

      it "should have a ID conforming to the xs:ID data type" do
        subject.id.should match(/[A-Za-z0-9-]+/)
      end

      its(:version) { should == "2.0" }

      describe "#issue_instant" do
        it "should have an issue instant formated as %Y-%m-%dT%H:%M:%SZ" do
          subject.issue_instant.should match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z/)
        end
   
        it "should be set to now" do
          t = double(Time)
          t.should_receive(:now).and_return(Time.now)
          RequestAbstract.new(t)
        end
      end
        
      describe "#issuer" do
        it do
          subject.issuer = 'test'
        end

        it "should have an issuer element in the xml when issuer is set" do
          subject.issuer = 'test'
          subject.to_xml.should match_xpath('//saml:Issuer')
        end

        it "should not have an issuer element in the xml when issuer is not set" do
          subject.to_xml.should_not match_xpath('//saml:Issuer')
        end
      end

    end
  end
end
