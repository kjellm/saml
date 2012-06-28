module SAML
  module Core
    class LogoutRequest < RequestAbstract

      attr_accessor :name_id
      attr_accessor :session_index
      
      def xml_document
        xml = Document.new
        root = xml.add_element("samlp:LogoutRequest")
      end

      def to_xml
        xml = super

        unless @name_id.nil?
          name_id_node = xml.root.add_element("saml:NameID")
          name_id_node.text = @name_id
        end

        unless @session_index.nil?
          session_index_node = xml.root.add_element("samlp:SessionIndex")
          session_index_node.text = @session_index
        end
        
        xml
      end
    end
  end
end
