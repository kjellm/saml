require "base64"
require "zlib"
require "cgi"

require 'saml/bindings/http_binding'

module SAML
  module Bindings

    #
    # Specified in
    # {http://docs.oasis-open.org/security/saml/v2.0/saml-bindings-2.0-os.pdf SAML v2.0 Bindings (PDF)},
    # section 3.4
    #
    class HTTPRedirect < HTTPBinding

      def build_request(rack_response, endpoint, saml_request, relay_state=nil)
        unless relay_state.nil?
          raise ArgumentError.new("relay_state must not exceed 80 bytes") if relay_state.bytesize > 80
        end
        request = saml_request.to_xml.to_s
        deflated_saml_request = deflate(request)
        query = "SAMLRequest=#{deflated_saml_request}"
        query += "&RelayState=#{url_enc(relay_state)}" unless relay_state.nil?
        url = "#{endpoint.location}?#{query}"
        rack_response.redirect url
      end

      private

      # Described in section 3.4.4.1
      def deflate(str)
        url_enc(base64_enc(compress(str)))
      end

      def inflate(str)
        # FIXME do we never need to URL.decode?
        decompress(base64_dec(str))
      end

      def compress(str)
        z = Zlib::Deflate.deflate(str, Zlib::BEST_COMPRESSION)
        # The SAML standard requires RFC1951 compliance. Zlib::Deflate
        # are RFC1950 compliant. By removing the 2 byte header and the
        # 4 byte tail (checksum), what's left is a deflate stream as
        # described in RFC1951.
        z[2..-5]
      end

      def decompress(str)
        z = Zlib::Inflate.new(-Zlib::MAX_WBITS) # Raw processing (no head or tail)
        z.inflate(str)
      end

      def url_enc(str)
        CGI.escape(str)
      end

      def url_dec(str)
        CGI.unescape(str)
      end

      def base64_enc(str)
        Base64.encode64(str)
      end

      def base64_dec(str)
        Base64.decode64(str)
      end
    end
  end
end
