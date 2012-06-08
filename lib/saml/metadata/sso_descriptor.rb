require 'saml/metadata/role_descriptor'

module SAML
  module Metadata
    class SSODescriptor < RoleDescriptor

      def from_xml(xml)
        super(xml)
        @single_logout_services = xml.get_elements('md:SingleLogoutService').map do |elem|
          Endpoint.from_xml(elem)
        end
        self
      end

      def single_logout_services
        @single_logout_services.clone
      end
      
    end
  end
end
