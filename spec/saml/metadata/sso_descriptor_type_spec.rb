require 'spec_helper'

module SAML
  module Metadata
    describe SSODescriptorType do

      before(:each) do
        @meta = SSODescriptorType.new
      end
      
      context "Unsupported features" do

        it "should fail when adding a ArtifactResolutionService" do
          expect {
            @meta.add_artifact_resolution_service(double('ArtifactResolutionService'))
          }.to raise_error('Unimplemented feature: ArtifactResolutionService')
        end

        it "should fail when adding a ManageNameIDService" do
          expect {
            @meta.add_manage_name_id_service(double('ManageNameIDService'))
          }.to raise_error('Unimplemented feature: ManageNameIDService')
        end

        it "should fail when adding a NameIDFormat" do
          expect {
            @meta.add_name_id_format(double('NameIDFormat'))
          }.to raise_error('Unimplemented feature: NameIDFormat')
        end

        it "should fail when adding a SingleLogoutService" do
          expect {
            @meta.add_single_logout_service(double('SingleLogoutService'))
          }.to raise_error('Unimplemented feature: SingleLogoutService')
        end

      end


    end
  end
end
