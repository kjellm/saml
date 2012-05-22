require 'uuid'

module SAML
  module Core
    class RequestAbstractType

      attr_reader :id
      attr_reader :version
      attr_reader :issue_instant

      def initialize(clock_class=Time)
        @id            = UUID.new.generate
        @version       = '2.0'
        @issue_instant = clock_class.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
      end

      def to_xml
        xml = REXML::Document.new
        root = xml.add_element("samlp:AuthnRequest",
                               { "xmlns:samlp" => "urn:oasis:names:tc:SAML:2.0:protocol" })
        root.attributes['ID']           = @id
        root.attributes['IssueInstant'] = @issue_instant
        root.attributes['Version']      = @version
        
        xml
      end

    end
  end
end
