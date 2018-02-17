require 'uri'

module Esa
  class Client
    attr_accessor :access_token, :team_name, :open_timeout, :read_timeout, :ssl_timeout

    END_POINT = 'https://api.esa.io'.freeze

    def initialize(options = {})
      if options.is_a?(Hash)
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      yield(self) if block_given?
    end

    def get_post(post_number, params = {}, headers = nil)
      request('GET', "/v1/teams/#{team}/posts/#{post_number}", params, headers)
    end

    def get_posts(params = {}, headers = nil)
      request('GET', "/v1/teams/#{team}/posts", params, headers)
    end

    def create_post(params, headers = nil)
      request('POST', "/v1/teams/#{team}/posts", params, headers)
    end

    def update_post(post_number, params = {}, headers = nil)
      request('PATCH', "/v1/teams/#{team}/posts/#{post_number}", params, headers)
    end

    def delete_post(post_number, headers = nil)
      request('DELETE', "/v1/teams/#{team}/posts/#{post_number}", nil, headers)
    end

    def get_teams(params = {}, headers = nil)
      request('GET', '/v1/teams', params, headers)
    end

    def get_team(params = {}, headers = nil)
      request('GET', "/v1/teams/#{team}", params, headers)
    end

    private

    def request(method, path, params = nil, headers = nil)
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
