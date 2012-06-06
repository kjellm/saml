require 'saml/metadata/role_descriptor'

module SAML
  module Metadata
    class SSODescriptor < RoleDescriptor

      def initialize
        super
        @single_logout_services = []
      end

      def add_single_logout_service(slo)
        @single_logout_services << slo
      end

      def single_logout_services
        @single_logout_services.clone
      end
      
    end
  end
end
