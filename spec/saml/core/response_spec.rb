# Response
# 
# SAML v2.0 Core
# 
# Section 3.3.3
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

require 'spec_helper'

module SAML
  module Core
    describe Response do

      it { should be_kind_of(StatusResponse) }

    end
  end
end
