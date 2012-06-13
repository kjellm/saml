module SAML
  module Core
    class Status

      attr_reader :status_code
      # FIXME attr_reader :status_message
      # FIXME attr_reader :status_detail
      
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
