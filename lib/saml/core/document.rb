require 'rexml/document'

module SAML
  module Core
    class Document < REXML::Document


      def initialize(*args)
        super(*args)
        XMLNamespaces.each {|k,v| add_namespace(k, v)}
      end
      
      # See REXML::Document#add_element
      #
      # Makes sure that all namespaces are added to the root element.
      def add_element(name, attrs={})
        ns = XMLNamespaces.map {|k, v| ["xmlns:#{k}", v]}
        ns = Hash[*ns.flatten]
        attrs.merge(ns)
        super(name, attrs)
      end

    end
  end
end
