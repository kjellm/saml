module SAML
  module Bindings

    #
    # Base class for the HTTP bindings. 
    #
    # (This is not an entity defined in the SAML standard.)
    #
    class HTTPBinding

      # @param rack_request A HTTP request object honoring the semantic for Rack::Request#params
      # @return (Response)
      def build_response(rack_request)
        xml_str = inflate(rack_request.params["SAMLResponse"])
        xml = Core::Document.new(xml_str).root
        Response.new(Core::Response.from_xml(xml), rack_request.params["RelayState"])
      end

    end
  end
end
