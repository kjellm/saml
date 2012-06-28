module SAML
  module Bindings
    class HTTPBinding

      def build_response(rack_request)
        xml_str = inflate(rack_request.params["SAMLResponse"])
        xml = Core::Document.new(xml_str).root
        Response.new(Core::Response.from_xml(xml), rack_request.params["RelayState"])
      end

    end
  end
end
