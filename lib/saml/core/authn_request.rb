require "rexml/document"
require "rexml/xpath"

module SAML
  module Core
    class AuthnRequest < RequestAbstract

      def xml_document
        xml = REXML::Document.new
        root = xml.add_element("samlp:AuthnRequest",
                               { "xmlns:samlp" => "urn:oasis:names:tc:SAML:2.0:protocol" })
      end

    end
  end
end
