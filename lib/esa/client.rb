require 'uri'

module Esa
  class Client
    attr_accessor :access_token, :team_name, :open_timeout, :read_timeout, :ssl_timeout

    END_POINT = 'https://api.esa.io'.freeze

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      yield(self) if block_given?
    end

    # GET /v1/teams/:team_name/posts/:post_number
    def get_post(post_number, params = {}, headers = nil)
      request('GET', "/v1/teams/#{team_name}/posts/#{post_number}", params, headers)
    end

    # GET /v1/teams/:team_name/posts
    def get_posts(params = {}, headers = nil)
      request('GET', "/v1/teams/#{team_name}/posts", params, headers)
    end

    # POST /v1/teams/:team_name/posts
    def create_post(params, headers = nil)
      request('POST', "/v1/teams/#{team_name}/posts", params, headers)
    end

    # PATCH /v1/teams/:team_name/posts/:post_number
    def update_post(post_number, params = {}, headers = nil)
      request('PATCH', "/v1/teams/#{team_name}/posts/#{post_number}", params, headers)
    end

    # DELETE /v1/teams/:team_name/posts/:post_number
    def delete_post(post_number, headers = nil)
      request('DELETE', "/v1/teams/#{team_name}/posts/#{post_number}", nil, headers)
    end

    private

    def default_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{access_token}"
      }
    end

    def connection(host, port)
      @connection ||= Esa::Connection.new(host, port)
    end

    def build_uri(method, path, params)
      uri = URI.parse(END_POINT)
      uri.path = path
      uri.query = URI.encode_www_form(params) if method == 'GET' && !params.empty?
      uri
    end

    def request(method, path, params = {}, headers = nil)
      uri = build_uri(method, path, params)
      conn = connection(uri.host, uri.port)
      conn.send(method, uri.request_uri, params, headers || default_headers)
    end
  end
end
