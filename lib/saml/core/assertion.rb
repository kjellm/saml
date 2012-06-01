module SAML
  module Core
    class Assertion
      
      attr_accessor :id
      attr_accessor :version
      attr_accessor :issue_instant
      attr_accessor :issuer

      attr_accessor :attribute_statement

      def self.from_xml(xml)
        XMLNamespaces.each {|k,v| xml.add_namespace(k, v)}

        assertion = new

        # Mandatory
        assertion.id            = xml.attributes['ID']
        assertion.version       = xml.attributes['Version']
        assertion.issue_instant = xml.attributes['IssueInstant']
        
        # Optional
        attribute_statements = xml.get_elements('saml:AttributeStatement')
        unless attribute_statements.empty?
          assertion.attribute_statement = AttributeStatement.from_xml(attribute_statements.first)
        end
        assertion
      end

    end
  end
end
