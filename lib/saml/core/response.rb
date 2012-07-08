require 'xml_signature'

module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 3.3.3
    #
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

      # Validates the XML Signature. Throws an exception if validation
      # fails.
      def validate(expected_certificate)
        XMLSignature.new(@xml).verify(expected_certificate)
      end

    end
  end
end
