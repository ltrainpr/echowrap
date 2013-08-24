require 'echonest/analysis'
require 'echonest/artist'
require 'echonest/asset'
require 'echonest/biography'
require 'echonest/blog'
require 'echonest/audio_summary'
require 'echonest/call_list'
require 'echonest/category_map'
require 'echonest/client'
require 'echonest/configurable'
require 'echonest/doc_counts'
require 'echonest/echonest_id'
require 'echonest/error'
require 'echonest/familiarity'
require 'echonest/feed'
require 'echonest/foreign_id'
require 'echonest/hotttnesss'
require 'echonest/genre'
require 'echonest/keyvalues'
require 'echonest/image'
require 'echonest/item'
require 'echonest/item_request'
require 'echonest/location'
require 'echonest/license'
require 'echonest/meta'
require 'echonest/news_article'
require 'echonest/options'
require 'echonest/playlist'
require 'echonest/prediction'
require 'echonest/rate_limit'
require 'echonest/reference'
require 'echonest/review'
require 'echonest/rule'
require 'echonest/seeds'
require 'echonest/sequenced_data'
require 'echonest/sequenced_data/bar'
require 'echonest/sequenced_data/beat'
require 'echonest/sequenced_data/section'
require 'echonest/sequenced_data/segment'
require 'echonest/sequenced_data/tatum'
require 'echonest/sandbox'
require 'echonest/song'
require 'echonest/status'
require 'echonest/taste_profile'
require 'echonest/term'
require 'echonest/track'
require 'echonest/update_info'
require 'echonest/urls'
require 'echonest/version'
require 'echonest/video'
require 'echonest/years_active'


module Echowrap
  class << self
    include Echowrap::Configurable

    # Delegate to a Echowrap::Client
    #
    # @return [Echowrap::Client]
    def client
      @client = Echowrap::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

    private

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end
  end
end

Echowrap.setup