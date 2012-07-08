module SAML
  module Core
    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # section 2.7.2
    #
    class AuthnStatement

      attr_reader :authn_instant
      attr_reader :session_not_on_or_after
      attr_reader :session_index

      attr_reader :authn_context

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        @authn_instant           = xml.attributes['AuthnInstant']
        @session_not_on_or_after = xml.attributes['SessionNotOnOrAfter']
        @session_index           = xml.attributes['SessionIndex']
        self
      end

    end
  end
end
