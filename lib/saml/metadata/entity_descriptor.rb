module SAML
  module Metadata
    class EntityDescriptor
      
      attr_accessor :entity_id
      attr_accessor :idp_sso_descriptors
      attr_accessor :sp_sso_descriptors

      def initialize
        @sp_sso_descriptors = []
        @idp_sso_descriptors = []
      end

      def add_sp_sso_descriptor(descriptor)
        @sp_sso_descriptors << descriptor
      end

      def sp_sso_descriptors
        @sp_sso_descriptors.clone
      end

      def add_idp_sso_descriptor(descriptor)
        @idp_sso_descriptors << descriptor
      end

      def idp_sso_descriptors
        @idp_sso_descriptors.clone
      end

    end
  end
end
