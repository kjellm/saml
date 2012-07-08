module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 2.3.3
    #
    class Assertion
      
      attr_reader :id
      attr_reader :version
      attr_reader :issue_instant
      attr_reader :issuer

      attr_reader :subject
      attr_reader :attribute_statement
      attr_reader :authn_statements
      attr_reader :conditions

      def self.from_xml(xml); new.from_xml(xml); end

      def initialize
        @authn_statements = []
      end

      def from_xml(xml)
        @id            = xml.attributes['ID']
        @version       = xml.attributes['Version']
        @issue_instant = xml.attributes['IssueInstant']
        
        subject_element = xml.get_elements('saml:Subject')
        unless subject_element.empty?
          @subject = Subject.from_xml(subject_element.first)
        end

        attribute_statements = xml.get_elements('saml:AttributeStatement')
        unless attribute_statements.empty?
          @attribute_statement = AttributeStatement.from_xml(attribute_statements.first)
        end

        xml.get_elements('saml:AuthnStatement').each do |as|
          @authn_statements << AuthnStatement.from_xml(as)
        end

        self
      end

    end
  end
end
