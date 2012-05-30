module SAML
  module Metadata
    class IDPSSODescriptor < SSODescriptor

      def initialize
        @single_sign_on_services = []
      end
      
      def want_authn_requests_signed?
        false
      end

      def add_single_sign_on_service(service)
        @single_sign_on_services << service
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
