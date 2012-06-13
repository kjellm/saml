module SAML
  module Bindings
    class HTTPPost

      def build_response(rack_request)
        xml = Core::Document.new(decode(rack_request.params["SAMLResponse"])).root
        Core::Response.from_xml(xml)
      end

      private

      def decode(str)
        Base64.decode64(str)
      end

    end
  end
end
