require 'net/http'
require 'openssl'
require 'json'

module Esa
  class Connection
    def initialize(host, port)
      @conn = Net::HTTP.new(host, port)
      @conn.use_ssl = true
      @conn.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    def send(method, path, params, headers)
      if method == 'GET'
        @conn.send_request(method, path, nil, headers)
      else
        @conn.send_request(method, path, params.to_json, headers)
      end
    end
  end
end
