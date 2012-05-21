require 'spec_helper'

module SAML
  module Metadata
    describe IDPSSODescriptor do

      before(:each) do
        @meta = IDPSSODescriptor.new
      end
      
      it "should construct" do
      end

      it "not want signed authn requests" do
        @meta.want_authn_requests_signed?.should be_false
      end

      it "should be able to hold SingleSignOnService metadata" do
        @meta.add_single_sign_on_service(double('singel-sign-on-service'))
      end


      context "Unsupported features" do

        it "should fail when adding NameIDMappingServices" do
          expect {
            @meta.add_name_id_mapping_service(double('NameIDMappingService'))
          }.to raise_error('Unimplemented feature: NameIDMappingService')
        end

        it "should fail when adding AssertionIDRequestServices" do
          expect {
            @meta.add_assertion_id_request_service(double('AssertionIDRequestService'))
          }.to raise_error('Unimplemented feature: AssertionIDRequestService')
        end

        it "should fail when adding AttributeProfiles" do
          expect {
            @meta.add_attribute_profile(double('AttributeProfile'))
          }.to raise_error('Unimplemented feature: AttributeProfile')
        end

        it "should fail when adding Attributes" do
          expect {
            @meta.add_attribute(double('Attribute'))
          }.to raise_error('Unimplemented feature: Attribute')
        end

      end

    end
  end
end
