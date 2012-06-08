module SAML
  module Metadata
    class SPSSODescriptor < SSODescriptor

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        super(xml)

        @assertion_consumer_services = xml.get_elements('md:AssertionConsumerService').map do |elem|
          IndexedEndpoint.from_xml(elem)
        end

        self
      end

      def assertion_consumer_services
        @assertion_consumer_services.clone
      end

    end
  end
end
