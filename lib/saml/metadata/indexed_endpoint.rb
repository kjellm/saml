module SAML
  module Metadata
    class IndexedEndpoint < Endpoint

      attr_reader :index
      attr_reader :is_default

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        super(xml)
        @index      = xml.attributes['Index']
        @is_default = xml.attributes['IsDefault']
        self
      end

    end
  end
end
