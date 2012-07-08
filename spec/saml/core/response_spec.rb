require 'spec_helper'

module SAML
  module Core
    describe Response do

      it { should be_kind_of(StatusResponse) }

      describe "#from_xml" do

        it do
          xml = Document.new(<<EOT).root
<sp:StatusResponse xmlns:sp='urn:oasis:names:tc:SAML:2.0:protocol' xmlns:s='urn:oasis:names:tc:SAML:2.0:assertion' ID="1" Version="2.0">
  <sp:Status><sp:StatusCode Value="Jolly good"/></sp:Status>
  <s:Assertion ID="1" Version="2.0" IssueInstant="right now"></s:Assertion>
</sp:StatusResponse>
EOT
          r = Response.from_xml(xml)
        end
      end
    end
  end
end
