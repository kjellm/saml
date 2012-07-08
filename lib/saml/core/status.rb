module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 3.2.2.1
    #
    class Status

      attr_reader :status_code
      
      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        @status_code = REXML::XPath.first(
          xml,
          "//samlp:Status/samlp:StatusCode/@Value", 
          { 'samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol'}
        ).value
        self
      end

      def success?
        @status_code == 'urn:oasis:names:tc:SAML:2.0:status:Success'
      end
      
    end
  end
end
