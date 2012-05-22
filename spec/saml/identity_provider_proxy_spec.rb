require 'spec_helper'

module SAML
  describe IdentityProviderProxy do

    it do
      binding = double('HttpRedirectBinding')
      request = double('HttpRedirectSSORequest')
      IdentityProviderProxy.new(binding)
      #binding.should_receive(:build_sso_request).and_return(request)
      #request.should_receive(:send)
    end
  end
end
