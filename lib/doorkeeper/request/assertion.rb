module Doorkeeper
  module Request
    class Assertion < Strategy
      attr_accessor :server

      delegate :credentials, :resource_owner_from_assertion, :parameters, :authorize, to: :server

      def request
        @request ||= OAuth::PasswordAccessTokenRequest.new(
          Doorkeeper.configuration,
          credentials,
          resource_owner_from_assertion,
          parameters
        )
      end
    end
  end
end
