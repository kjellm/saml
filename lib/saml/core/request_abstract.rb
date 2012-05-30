require 'uuid'

module SAML
  module Core
    class RequestAbstract

      attr_reader :id
      attr_reader :version
      attr_reader :issue_instant

      attr_accessor :issuer

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

        unless @issuer.nil?
          issuer_node = root.add_element("saml:Issuer",
                                         { "xmlns:saml" => "urn:oasis:names:tc:SAML:2.0:assertion" })
          issuer_node.text = @issuer
        end
        
        xml
      end

    end
  end
end
