require 'spec_helper'

module SAML
  describe Bindings do

    context "#from_endpoint" do
      
      it "should return nil on invalid endpoint" do
        endpoint = double('Meta::Endpoint').as_null_object
        Bindings.from_endpoint(endpoint).should be_nil
      end

      it "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" do
        endpoint = double('Meta::Endpoint')
        endpoint.should_receive(:binding).and_return("urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST")
        Bindings.from_endpoint(endpoint).should be_instance_of(Bindings::HTTPPost)
      end
      
      it "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" do
        endpoint = double('Meta::Endpoint')
        endpoint.should_receive(:binding).and_return("urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect")
        Bindings.from_endpoint(endpoint).should be_instance_of(Bindings::HTTPRedirect)
      end
      
    end

  end
end
