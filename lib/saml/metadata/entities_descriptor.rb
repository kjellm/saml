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
      end

      def idp
        @entity_descriptors.each do |entity|
          return entity if entity.idp?
        end
      end

    end
  end
end
