module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # section 2.7.3.1
    #
    class Attribute

      attr_reader :name
      attr_reader :name_format
      attr_reader :attribute_values

      def self.from_xml(xml); new.from_xml(xml); end

      def initialize
        @attribute_values = []
      end
      
      def default_name_format
        'urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified'
      end

      def from_xml(xml)
        @name = xml.attributes['Name']
        @name_format = xml.attributes['NameFormat'] || default_name_format
        
        xml.each_element() do |av|
          @attribute_values << av
        end

        self
      end

    end
  end
end
