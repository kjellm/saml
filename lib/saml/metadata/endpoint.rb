require 'uri'

module SAML
  module Metadata
    class Endpoint

      attr_reader :binding
      attr_reader :location
      attr_reader :response_location

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        @binding  = xml.attributes['Binding']
        @location = URI(xml.attributes['Location'])
        @response_location = xml.attributes['ResponseLocation'] && URI(xml.attributes['ResponseLocation'])
        self
      end

    end
  end
end
