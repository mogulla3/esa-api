module Esa
  class Client
    module User
      def get_users(params = {}, headers = nil)
        request('GET', '/v1/user', params, headers)
      end
    end
  end
end