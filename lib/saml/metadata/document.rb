require 'rexml/document'

module SAML
  module Metadata
    class Document < REXML::Document

      def initialize(*args)
        super(*args)
        XMLNamespaces.each {|k,v| add_namespace(k, v)}
      end

    end
  end
end
