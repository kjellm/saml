module SAML
  module Core
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
