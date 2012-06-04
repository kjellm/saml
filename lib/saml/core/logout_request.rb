module SAML
  module Core
    class LogoutRequest < RequestAbstract

      attr_accessor :name_id
      
      def xml_document
        xml = REXML::Document.new
        root = xml.add_element("samlp:LogoutRequest",
                               { "xmlns:samlp" => "urn:oasis:names:tc:SAML:2.0:protocol" })
      end

      def to_xml
        xml = super

        unless @name_id.nil?
          name_id_node = xml.root.add_element("saml:NameID", { "xmlns:saml" => "urn:oasis:names:tc:SAML:2.0:assertion" })
          name_id_node.text = @name_id
        end
        
        xml
      end
    end
  end
end
