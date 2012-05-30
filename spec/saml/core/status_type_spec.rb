# StatusType
# 
# SAML v2.0 Core
# 
# Section 3.2.2.1
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require 'spec_helper'

module SAML
  module Core
    describe StatusType do
      it "should only allow the following top-level status codes"
      # urn:oasis:names:tc:SAML:2.0:status:Success
      #   The request succeeded. Additional information MAY be returned in the <StatusMessage> and/or <StatusDetail> elements.
      # urn:oasis:names:tc:SAML:2.0:status:Requester
      #   The request could not be performed due to an error on the part of the requester.
      # urn:oasis:names:tc:SAML:2.0:status:Responder
      #   The request could not be performed due to an error on the part of the SAML responder or SAML authority.
      # urn:oasis:names:tc:SAML:2.0:status:VersionMismatch
      #   The SAML responder could not process the request because the version of the request message was incorrect.

    end
  end
end
