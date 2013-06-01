require 'echonest/api/utils'

module Echonest
  module API
    module Oauth
      include Echonest::API::Utils

      # Returns the current time of The Echo Nest API server. This time can be used to synchronize the local time with The Echo Nest allowing you to set a proper timestamp used generate authenticated requests to the API. This call returns the number of seconds elapsed since midnight, 1 January 1970.
      # @see http://developer.echonest.com/docs/v4/oauth.html#timestamp
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Integer]
      # @param options [Hash] A customizable set of options.
      #
      # @return [Integer]
      # @example Return integer timestamp
      #   Echonest.oauth_timestamp
      def oauth_timestamp(options={})
        response = send(:get, '/api/v4/oauth/timestamp', options)
        response[:body][:response][:current_time]
      end

    end
  end
end
