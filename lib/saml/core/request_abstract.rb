require 'uuid'

module SAML
  module Core

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf SAML v2.0 Core (PDF)},
    # Section 3.2.1
    #
    # Abstract base class. Not to be instantiated directly.
    #
    class RequestAbstract

      # The uuid gem is used to generate the value for this attribute
      # in the constructor
      attr_reader :id

      # Always "2.0"
      attr_reader :version

      # Time.now.utc
      attr_reader :issue_instant

      attr_accessor :issuer

      def initialize(clock_class=Time)
        @id            = UUID.new.generate
        @version       = '2.0'
        @issue_instant = clock_class.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
      end

      def to_xml
        xml = xml_document
        root = xml.root
        root.attributes['ID']           = @id
        root.attributes['IssueInstant'] = @issue_instant
        root.attributes['Version']      = @version

        unless @issuer.nil?
          issuer_node = root.add_element("saml:Issuer")
          issuer_node.text = @issuer
        end
        
        xml
      end

      private

      def xml_document
        xml = Document.new
        root = xml.add_element("samlp:RequestAbstract")
      end

    end
  end
end
