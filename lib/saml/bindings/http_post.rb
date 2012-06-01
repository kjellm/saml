module SAML
  module Bindings
    class HTTPPost

      def build_response(rack_request)
        xml = REXML::Document.new(decode(rack_request.params["SAMLResponse"])).root
        Core::XMLNamespaces.each {|k,v| xml.add_namespace(k, v)}
        Core::Response.from_xml(xml)
      end

      private

      def decode(str)
        Base64.decode64(str)
      end

    end
  end
end
