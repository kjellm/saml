module SAML
  module Metadata
    class EntityDescriptor
      
      attr_accessor :entity_id

      def self.from_xml(xml)
        allocate.from_xml(xml)
      end

      def from_xml(xml)
        @entity_id = xml.attributes['entityID']
        @sp_sso_descriptors = xml.get_elements('md:SPSSODescriptor').map do |elem|
          SPSSODescriptor.from_xml(elem)
        end
        @idp_sso_descriptors = xml.get_elements('md:IDPSSODescriptor').map do |elem|
          IDPSSODescriptor.from_xml(elem)
        end
        require 'pry'; binding.pry
        self
      end

      def sp_sso_descriptors
        @sp_sso_descriptors.clone
      end

      def idp_sso_descriptors
        @idp_sso_descriptors.clone
      end

      def sp?
        not @sp_sso_descriptors.empty?
      end

      def idp?
        not @idp_sso_descriptors.empty?
      end

    end
  end
end
