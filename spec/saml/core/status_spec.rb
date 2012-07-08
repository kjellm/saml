require 'spec_helper'

module SAML
  module Core
    describe Status do
      it "should only allow the following top-level status codes"
      # urn:oasis:names:tc:SAML:2.0:status:Success
      #   The request succeeded. Additional information MAY be returned in the <StatusMessage> and/or <StatusDetail> elements.
      # urn:oasis:names:tc:SAML:2.0:status:Requester
      #   The request could not be performed due to an error on the part of the requester.
      # urn:oasis:names:tc:SAML:2.0:status:Responder
      #   The request could not be performed due to an error on the part of the SAML responder or SAML authority.
      # urn:oasis:names:tc:SAML:2.0:status:VersionMismatch
      #   The SAML responder could not process the request because the version of the request message was incorrect.

      it "should have a status_message"
      it "should have a status_detail"


    end
  end
end
