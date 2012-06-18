module SAML
  module Core
    class Subject

      attr_reader :name_id

      def from_xml(xml)
        @name_id = xml.get_elements('saml:NameID').text
      end

    end
  end
end
