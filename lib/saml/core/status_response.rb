module SAML
  module Core
    class StatusResponse

      attr_reader :id
      attr_reader :version
      attr_reader :status

      def self.from_xml(xml); new.from_xml(xml); end
      
      def from_xml(xml)
        @id      = xml.attributes["ID"]
        @version = xml.attributes["Version"]
        @status  = Status.from_xml(xml.get_elements("//samlp:Status"))
        self
      end

      def success?
        status.success?
      end

    end
  end
end
