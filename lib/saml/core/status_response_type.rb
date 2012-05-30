module SAML
  module Core
    class StatusResponseType

      attr_accessor :id
      attr_accessor :version
      attr_accessor :status

      def self.from_xml(xml)
        response = new
        response.id = REXML::XPath.first(
          xml,
          "//@ID", 
          { 'samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol'}
        ).value
        response.version = REXML::XPath.first(
          xml,
          "//@Version", 
          { 'samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol'}
        ).value
        response.status = StatusType.from_xml(REXML::XPath.first(xml, "//samlp:Status", { 'samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol'}))
        response
      end

    end
  end
end
