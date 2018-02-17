require 'uri'
require 'esa/connection'
require 'esa/response'
require 'esa/client/team'
require 'esa/client/stats'
require 'esa/client/member'
require 'esa/client/post'
require 'esa/client/comment'
require 'esa/client/star'
require 'esa/client/watch'
require 'esa/client/category'
require 'esa/client/invitation'
require 'esa/client/emoji'
require 'esa/client/user'

module Esa
  class Client
    include Esa::Client::Team
    include Esa::Client::Stats
    include Esa::Client::Member
    include Esa::Client::Post
    include Esa::Client::Comment
    include Esa::Client::Star
    include Esa::Client::Watch
    include Esa::Client::Category
    include Esa::Client::Invitation
    include Esa::Client::Emoji
    include Esa::Client::User

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

    def request(method, path, params = nil, headers = nil)
      uri.path = path
      uri.query = URI.encode_www_form(params) if method == 'GET' && params.is_a?(Hash)
      Esa::Response.new(connection.send(method, uri.request_uri, params, headers || default_headers))
    end

    private

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
