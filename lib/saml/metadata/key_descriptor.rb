module SAML
  module Metadata
    class KeyDescriptor
      
      attr_accessor :use
      attr_accessor :key_info
      attr_accessor :x509_certificate

      def self.from_xml(xml); new.from_xml(xml); end

      def from_xml(xml)
        @use = xml.attributes['use']
        puts xml.to_s(2)
        @x509_certificate = REXML::XPath.first(xml, '//ds:X509Certificate').text
        
        self
      end

    end
  end
end
