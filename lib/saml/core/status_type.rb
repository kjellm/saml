module SAML
  module Core
    class StatusType

      attr_accessor :status_code
      #attr_accessor :status_message
      #attr_accessor :status_detail
      
      def self.from_xml(xml)
        puts xml
        status = new
        status.status_code = REXML::XPath.first(
          xml,
          "//samlp:Status/samlp:StatusCode/@Value", 
          { 'samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol'}
        ).value
        status
      end
      
    end
  end
end
