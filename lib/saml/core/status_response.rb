module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 3.2.2
    #
    class StatusResponse

      attr_reader :id
      attr_reader :version
      attr_reader :status

      def self.from_xml(xml); new.from_xml(xml); end
      
      def from_xml(xml)
        @id      = xml.attributes["ID"]
        @version = xml.attributes["Version"]
        @status  = Status.from_xml(xml.get_elements("samlp:Status").first)
        self
      end

      def success?
        status.success?
      end

    end
  end
end
