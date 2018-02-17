require 'uri'
require 'esa/connection'
require 'esa/response'
require 'esa/client/team'
require 'esa/client/member'
require 'esa/client/post'
require 'esa/client/comment'
require 'esa/client/star'
require 'esa/client/watch'
require 'esa/client/category'
require 'esa/client/invitation'

module Esa
  class Client
    include Esa::Client::Team
    include Esa::Client::Member
    include Esa::Client::Post
    include Esa::Client::Comment
    include Esa::Client::Star
    include Esa::Client::Watch
    include Esa::Client::Category
    include Esa::Client::Invitation

    attr_accessor :access_token, :team_name #, :open_timeout, :read_timeout, :ssl_timeout

    END_POINT = 'https://api.esa.io'.freeze

    def initialize(options = {})
      if options.is_a?(Hash)
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      yield(self) if block_given?
    end

    def get(path, params = {}, headers = nil)
      request('GET', path, params, headers)
    end

    def post(path, params, headers = nil)
      request('POST', path, params, headers)
    end

    def patch(path, params, headers = nil)
      request('PATCH', path, params, headers)
    end

    def delete(path, headers = nil)
      request('DELETE', path, nil, headers)
    end

    private

    def request(method, path, params, headers)
      uri.path = path
      uri.query = URI.encode_www_form(params) if method == 'GET' && params.is_a?(Hash)
      Esa::Response.new(connection.send(method, uri.request_uri, params, headers || default_headers))
    end

    def connection
      @connection ||= Esa::Connection.new(uri.host, uri.port)
    end

    def uri
      @uri ||= URI.parse(END_POINT)
    end

    def team
      raise("team_name must be specified") if @team_name == nil
      @team_name
    end

    def default_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@access_token}"
      }
    end
  end
end
