# StatusResponseType
# 
# SAML v2.0 Core
# 
# Section 3.2.2
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require 'spec_helper'

require 'rexml/document'

module SAML
  module Core
    describe StatusResponseType do

      #ID [Required]
      #InResponseTo [Optional]
      #Version [Required]
      #IssueInstant [Required]
      #Destination [Optional]
      #Consent [Optional]
      #<saml:Issuer> [Optional]
      #<ds:Signature> [Optional]
      #<Extensions> [Optional]
      #<Status> [Required]

      describe "#from_xml" do

        context "Minimal valid XML" do
          
          subject do
            r = StatusResponseType.from_xml(REXML::Document.new(<<EOT))
<sp:StatusResponseType xmlns:sp='urn:oasis:names:tc:SAML:2.0:protocol' ID="1" Version="2.0">
  <sp:Status><sp:StatusCode>Jolly good</sp:StatusCode></sp:Status>
</sp:StatusResponseType>
EOT
          end
          
          its(:id)      { should == "1" }
          its(:version) { should == "2.0" }
          its(:status)  { subject.status_code.should == "Jolly good"}
        end

        it "should fail when required fields are missing"
      end
    end
  end
end
