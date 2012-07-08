require 'spec_helper'

module SAML
  module Core
    describe Attribute do

      describe "#from_xml" do

        context "Minimal valid XML" do
          
          subject do
            r = Attribute.from_xml(Document.new(<<EOT).root)
<s:Attribute xmlns:s='urn:oasis:names:tc:SAML:2.0:assertion' Name="Foo">
  <s:AttributeValue>Hei</s:AttributeValue>
</s:Attribute>
EOT
          end
          
          its(:name)             { should == "Foo" }
          its(:name_format)      { should == "urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified" }
          its(:attribute_values) { subject.first.text.should == 'Hei' }

        end
      end
    end
  end
end
