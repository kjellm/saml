# XML Namespaces
# 
# SAML v2.0 Core
# 
# Section 1.2 (and 1.1)
#
# http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
#

module SAML
  module Core
    
    XMLNamespaces = {
      :saml  => 'urn:oasis:names:tc:SAML:2.0:assertion',
      :samlp => 'urn:oasis:names:tc:SAML:2.0:protocol',
      :ds    => 'http://www.w3.org/2000/09/xmldsig#',
      :xenc  => 'http://www.w3.org/2001/04/xmlenc#',
    }

  end
end
