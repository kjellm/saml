require "rexml/document"
require "rexml/xpath"

module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 3.4.1
    #
    # Used in the SSO profiles as the first step a service provider
    # takes when the user requests a resource on the service provider
    # for which a security context is required (and not already
    # established).
    #
    class AuthnRequest < RequestAbstract

      private

      # Override the parent to ensure correct document root.
      def xml_document
        xml = Document.new
        root = xml.add_element("samlp:AuthnRequest")
      end

    end
  end
end
