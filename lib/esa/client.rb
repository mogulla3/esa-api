require 'net/http'
require 'uri'
require 'openssl'
require 'json'

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
      request("GET", "/v1/teams/#{team_name}/posts/#{post_number}", params, headers)
    end

    # GET /v1/teams/:team_name/posts
    def get_posts(params = {}, headers = nil)
      request("GET", "/v1/teams/#{team_name}/posts", params, headers)
    end

    # POST /v1/teams/:team_name/posts
    def create_post(params, headers = nil)
      request("POST", "/v1/teams/#{team_name}/posts", params, headers)
    end

    # PATCH /v1/teams/:team_name/posts/:post_number
    def update_post(post_number, params = {}, headers = nil)
      request("PATCH", "/v1/teams/#{team_name}/posts/#{post_number}", params, headers)
    end

    # DELETE /v1/teams/:team_name/posts/:post_number
    def delete_post(post_number, headers = nil)
      request("DELETE", "/v1/teams/#{team_name}/posts/#{post_number}", nil, headers)
    end

    private

    def default_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{access_token}"
      }
    end

    def request(method, path, params = {}, headers = nil)
      uri = if method == "GET" && !params.empty?
              URI.parse("#{END_POINT}#{path}?#{URI.encode_www_form(params)}")
            else
              URI.parse("#{END_POINT}#{path}")
            end

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      if method == "GET"
        http.send_request(method, uri.request_uri, nil, headers || default_headers)
      else
        http.send_request(method, uri.request_uri, params.to_json, headers || default_headers)
      end
    end
  end
end