module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 2.7.3
    #
    class AttributeStatement

      attr_accessor :attributes

      def self.from_xml(xml); new.from_xml(xml); end

      def initialize
        @attributes = []
      end

      def from_xml(xml)
        xml.each_element('saml:Attribute') do |a|
          @attributes << Attribute.from_xml(a)
        end
        self
      end

    end
  end
end
