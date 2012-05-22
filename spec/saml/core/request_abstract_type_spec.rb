# RequestAbstractType
# 
# SAML v2.0 Core
# 
# Section 3.2.1
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require 'spec_helper'

module SAML
  module Core
    describe RequestAbstractType do

      it "should have a ID conforming to the xs:ID data type" do
        r = RequestAbstractType.new
        r.id.should match(/[[:word:]-]+/)
      end

      it "should be version 2.0" do
        r = RequestAbstractType.new
        r.version.should == "2.0"
      end

      describe "#issue_instant" do
        it "should have an issue instant formated as %Y-%m-%dT%H:%M:%SZ" do
          r = RequestAbstractType.new
          r.issue_instant.should match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z/)
        end
   
        it "should be set to now" do
          t = double(Time)
          t.should_receive(:now).and_return(Time.now)
          r = RequestAbstractType.new(t)
        end
      end
        
      %w(Destination Consent Issuer Signature Extensions).each do |attr|
        it "should not support #{attr}"
      end
      
    end
  end
end
