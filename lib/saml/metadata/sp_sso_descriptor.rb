module SAML
  module Metadata
    class SPSSODescriptor < SSODescriptor

      def initialize
        super
        @assertion_consumer_services = []
      end

      def add_assertion_consumer_service(acs)
        @assertion_consumer_services << acs
      end

      def assertion_consumer_services
        @assertion_consumer_services.clone
      end

    end
  end
end
