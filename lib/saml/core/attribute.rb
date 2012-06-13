module SAML
  module Core
    class Attribute

      attr_accessor :name
      attr_accessor :name_format
      attr_accessor :attribute_values

      def self.from_xml(xml)
        attribute = new
        attribute.name = xml.attributes['Name']
        
        nf = xml.attributes['NameFormat']
        attribute.name_format = nf.nil? ? 'urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified' : nf
        
        values = []
        xml.each_element() do |av|
          values << av.to_s
        end
        attribute.attribute_values = values
        attribute
      end
    end
  end
end
