module SAML
  module Bindings
    class Response

      attr_reader :core_response
      attr_reader :relay_state

      def initialize(core_response, relay_state)
        @core_response = core_response
        @relay_state   = relay_state
      end

    end
  end
end
