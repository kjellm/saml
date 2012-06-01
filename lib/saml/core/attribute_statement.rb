module SAML
  module Core
    class AttributeStatement

      attr_accessor :attributes

      def self.from_xml(xml)
        statement = new
        attrs = []
        xml.each_element('saml:Attribute') do |a|
          attrs << Attribute.from_xml(a)
        end
        statement.attributes = attrs

        statement
      end

    end
  end
end
