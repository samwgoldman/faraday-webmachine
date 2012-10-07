# require 'faraday-webmachine/version'
require 'faraday'
require 'webmachine'

module Faraday
  class Adapter
    register_middleware :webmachine => :Webmachine

    class Webmachine
      def initialize(foo, app)
        puts foo.call({})
        @dispatcher = app.dispatcher
      end

      def call(env)
        request = ::Webmachine::Request.new("GET", env[:url], {}, "")
        response = ::Webmachine::Response.new
        @dispatcher.dispatch(request, response)
        response
      end
    end
  end
end
