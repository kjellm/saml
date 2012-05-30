module SAML
  module Metadata
    class SSODescriptor

      def add_artifact_resolution_service(*args)
        raise 'Unimplemented feature: ArtifactResolutionService'
      end

      
      def add_manage_name_id_service(*args)
        raise 'Unimplemented feature: ManageNameIDService'
      end

      
      def add_name_id_format(*args)
        raise 'Unimplemented feature: NameIDFormat'
      end

      def add_single_logout_service(*args)
        raise 'Unimplemented feature: SingleLogoutService'
      end

      
    end
  end
end
