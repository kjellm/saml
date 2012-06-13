# Assertion
# 
# SAML v2.0 Core
# 
# Section 2.3.3
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require "spec_helper"

module SAML
  module Core
    describe Assertion do

      describe "#from_xml" do

        def xml(str='')
          Document.new(<<EOT).root
<s:Assertion xmlns:s='urn:oasis:names:tc:SAML:2.0:assertion' ID="1" Version="2.0" IssueInstant="2012-01-01T07:00:00Z">
  <s:Issuer>Me</s:Issuer>
  #{str}
</s:Assertion>
EOT
        end

        context "Minimal valid XML" do
          
          subject do
            Assertion.from_xml(xml)
          end
          
          its(:id)             { should == "1" }
          its(:version)        { should == "2.0" }
          its(:issue_instant)  { should == "2012-01-01T07:00:00Z" }
        end

        context "With AttributeStatement" do
          it do
            a = Assertion.from_xml(xml('<s:AttributeStatement><s:Attribute Name="Foo"><s:AttributeValue>Bar</s:AttributeValue></s:Attribute></s:AttributeStatement>'))
            a.attribute_statement.attributes.first.name.should == "Foo"
          end
        end
        
        it "should fail when required fields are missing"
      end
    end
  end
end
      
