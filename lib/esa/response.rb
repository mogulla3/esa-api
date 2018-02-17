require 'json'

module Esa
  class Response
    attr_reader :raw_body, :code, :message, :http_version

    def initialize(response)
      @raw_body = response.body
      @code = response.code
      @message = response.message
      @http_version = response.http_version
    end

    def body
      @body ||= JSON.parse(@raw_body)
    end
  end
end
