require "rexml/document"
require "rexml/xpath"

module SAML
  module Core
    class AuthnRequest < RequestAbstract

      def xml_document
        xml = Document.new
        root = xml.add_element("samlp:AuthnRequest")
      end

    end
  end
end
