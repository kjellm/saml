require "base64"

require 'saml/bindings/http_binding'

module SAML
  module Bindings

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-bindings-2.0-os.pdf SAML v2.0 Bindings (PDF)},
    # section 3.5
    #
    class HTTPPost < HTTPBinding

      private

      def inflate(str)
        Base64.decode64(str)
      end

    end
  end
end
