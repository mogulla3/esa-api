module Esa
  class Client
    module Stats
      def get_stats(params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/stats", params, headers)
      end
    end
  end
end