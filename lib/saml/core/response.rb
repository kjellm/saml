require 'xml_signature'

module SAML
  module Core
    class Response < StatusResponse

      attr_reader :assertions

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        super(xml)
        @xml = xml

        @assertions = xml.get_elements('saml:Assertion').map do |a|
          Assertion.from_xml(a)
        end
        
        self
      end

      def valid?(expected_certificate)
        XMLSignature.new(@xml).verify(expected_certificate)
      end

    end
  end
end
