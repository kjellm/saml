module SAML
  module Metadata
    class IDPSSODescriptor < SSODescriptor

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        super(xml)
        @single_signon_services = xml.get_elements('md:SingleSignOnService').map do |elem|
          Endpoint.from_xml(elem)
        end
        self
      end

      def want_authn_requests_signed?
        false
      end

      def single_signon_services
        @single_signon_services.clone
      end

    end
  end
end
