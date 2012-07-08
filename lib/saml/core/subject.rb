module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 2.4.1
    #
    class Subject

      attr_reader :name_id

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        @name_id = xml.get_elements('saml:NameID').first.text
        self
      end

    end
  end
end
