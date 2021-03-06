require 'spec_helper'

module SAML
  module Core
    describe StatusResponse do

      describe "#from_xml" do

        context "Minimal valid XML" do
          
          subject do
            xml = Document.new(<<EOT)
<sp:StatusResponse xmlns:sp='urn:oasis:names:tc:SAML:2.0:protocol' ID="1" Version="2.0">
  <sp:Status><sp:StatusCode Value="Jolly good"/></sp:Status>
</sp:StatusResponse>
EOT
            StatusResponse.from_xml(xml.root)
          end
          
          its(:id)      { should == "1" }
          its(:version) { should == "2.0" }
          its(:status)  { subject.status_code.should == "Jolly good" }
        end

      end
    end
  end
end
