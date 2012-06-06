module SAML
  module Metadata
    class IDPSSODescriptor < SSODescriptor

      def initialize
        super
        @single_signon_services = []
      end
      
      def want_authn_requests_signed?
        false
      end

      def add_single_signon_service(service)
        @single_signon_services << service
      end

      def single_signon_services
        @single_signon_services.clone
      end

      def add_name_id_mapping_service(*args)
        raise 'Unimplemented feature: NameIDMappingService'
      end

      def add_assertion_id_request_service(*args)
        raise 'Unimplemented feature: AssertionIDRequestService'
      end

      def add_attribute_profile(*args)
        raise 'Unimplemented feature: AttributeProfile'
      end

      def add_attribute(*args)
        raise 'Unimplemented feature: Attribute'
      end

    end
  end
end
