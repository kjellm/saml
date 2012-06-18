module SAML
  module Core
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
