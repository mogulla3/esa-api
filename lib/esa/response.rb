module Esa
  class Response
    def initialize(response)
      @body = response.body
      @code = response.code
      @message = response.message
      @http_version = response.http_version
    end

    def code
      @code
    end

    def message
      @message
    end

    def http_version
      @http_version
    end

    def body
      JSON.parse(@body)
    end

    def raw_body
      @body
    end
  end
end