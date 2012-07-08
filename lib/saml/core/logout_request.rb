module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 3.7.1
    #
    class LogoutRequest < RequestAbstract

      attr_accessor :name_id
      attr_accessor :session_index
      
      # Override the parent to ensure correct document root.
      def xml_document
        xml = Document.new
        root = xml.add_element("samlp:LogoutRequest")
      end

      def to_xml
        xml = super
        add_optional_element(xml, @name_id, 'saml:NameID')
        add_optional_element(xml, @session_index, 'samlp:SessionIndex')
        xml
      end

      private

      def add_optional_element(xml, attr, elem)
        return if attr.nil?
        node = xml.root.add_element(elem)
        node.text = attr
      end
        
    end
  end
end
