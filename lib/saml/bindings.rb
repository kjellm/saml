module SAML
  module Bindings

    # Factory method taking a Meta::Endpoint and returning the
    # apropriate binding object.
    def self.from_endpoint(endpoint)
      klass = case endpoint.binding
              when "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
                Bindings::HTTPPost
              when "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
                Bindings::HTTPRedirect
              else
                nil
              end
      klass.nil? ? nil : klass.new
    end

  end
end
