module SAML
  module Bindings

    def self.from_endpoint(endpoint)
      klass = case endpoint.binding
              when "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
                Bindings::HTTPPost
              when "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
                Bindings::HTTPRedirect
              else
                nil
              end
      klass.new
    end

  end
end
