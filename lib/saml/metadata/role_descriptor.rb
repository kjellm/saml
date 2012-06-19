module SAML
  module Metadata
    class RoleDescriptor
      
      attr_accessor :protocol_support_enumeration
      attr_accessor :key_descriptors

      def from_xml(xml)
        @key_descriptors = xml.get_elements('md:KeyDescriptor').map do |kd_node|
          KeyDescriptor.from_xml(kd_node)
        end
        self
      end

      def signing_key_descriptor
        @key_descriptors.find {|kd| kd.use == 'signing' }
      end

    end
  end
end
