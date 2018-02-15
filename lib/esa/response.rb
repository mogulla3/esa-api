module Esa
  class Response
    attr_reader :code, message, :http_version

    def initialize(response)
      @body = response.body
      @code = response.code
      @message = response.message
      @http_version = response.http_version
    end

    def body
      JSON.parse(@body)
    end

    def raw_body
      @body
    end
  end
end