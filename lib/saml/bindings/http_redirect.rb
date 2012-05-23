require "base64"
require "zlib"
require "cgi"

module SAML
  module Bindings
    class HTTPRedirect

      def build_request_url(location, saml_request_xml, relay_state=nil)
        unless relay_state.nil?
          raise ArgumentError.new("relay_state must not exceed 80 bytes") if relay_state.bytesize > 80
        end
        request = ""
        saml_request_xml.write(request)
        deflated_saml_request = deflate(request)
        query = "SAMLRequest=#{deflated_saml_request}"
        query += "&RelayState=#{url_enc(relay_state)}" unless relay_state.nil?
        "#{location}?#{query}"
      end

      private
      
      # Described in section 3.4.4.1
      def deflate(str)
        url_enc(base64_enc(compress(str)))
      end

      def compress(str)
        z = Zlib::Deflate.deflate(str, Zlib::BEST_COMPRESSION)
        # The SAML standard requires RFC1951 compliance. Zlib::Deflate
        # are RFC1950 compliant. By removing the 2 byte header and the
        # 4 byte tail (checksum), whats left is a deflate stream as
        # described in RFC1951.
        z[2..-5]
      end

      def base64_enc(str)
        Base64.encode64(str)
      end

      def url_enc(str)
        CGI.escape(str)
      end

    end
  end
end
