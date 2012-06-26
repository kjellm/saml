module SAML
  module Metadata
    class EntitiesDescriptor

      attr_reader :entity_descriptors
      
      def self.from_xml(xml)
        allocate.from_xml(xml)
      end

      def from_xml(xml)
        @entity_descriptors = xml.get_elements('md:EntityDescriptor').map do |ed_node|
          EntityDescriptor.from_xml(ed_node)
        end
        self
      end

      def sp
        @entity_descriptors.each do |entity|
          return entity if entity.sp?
        end
        nil
      end

      def idp
        @entity_descriptors.each do |entity|
          return entity if entity.idp?
        end
        nil
      end

      def sp_assertion_consumer_service
        sp.sp_sso_descriptors.first.assertion_consumer_services.first
      end

      def sp_single_logout_service
        sp.sp_sso_descriptors.first.single_logout_services.first
      end

      def idp_single_signon_service
        idp.idp_sso_descriptors.first.single_signon_services.first
      end

    end
  end
end
