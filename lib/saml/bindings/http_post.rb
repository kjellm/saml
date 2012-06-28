require "base64"

require 'saml/bindings/http_binding'

module SAML
  module Bindings
    class HTTPPost < HTTPBinding

      def inflate(str)
        Base64.decode64(str)
      end

    end
  end
end
