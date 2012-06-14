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
      def add_element(name)
        ns = XMLNamespaces.map {|k, v| ["xmlns:#{k}", v]}
        ns = Hash[*ns.flatten]
        super(name, ns)
      end

    end
  end
end
