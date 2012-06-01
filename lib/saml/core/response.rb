module SAML
  module Core
    class Response < StatusResponse

      attr_accessor :assertions

      def self.from_xml(xml)
        res = super(xml)
        
        assertions = xml.get_elements('saml:Assertion')
        unless assertions.empty?
          res.assertions = assertions.map do |a|
            Assertion.from_xml(a)
          end
        end
        
        res
      end

    end
  end
end
