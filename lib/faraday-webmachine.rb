# require 'faraday-webmachine/version'
require 'faraday'
require 'webmachine'

module Faraday
  # Faraday's design seems to encourage additional adapters
  # to go both inside this class's namespace, and to be
  # subclassed from it.
  class Adapter
    register_middleware :webmachine => :Webmachine

    # I convert Faraday requests to Webmachine
    class Webmachine < Faraday::Adapter
      def initialize(faraday_app, webmachine_app)
        super(faraday_app)
        @dispatcher = webmachine_app.dispatcher
      end

      def call(env)
        response = ::Webmachine::Response.new
        @dispatcher.dispatch(request(env), response)
        # TODO: convert this back to a Faraday response object
        response
      end

      def request(env)
        method = env[:method].to_s.upcase
        url = env[:url]
        headers = env[:request_headers]
        body = env[:body]
        ::Webmachine::Request.new(method, url, headers, body)
      end
    end
  end
end
