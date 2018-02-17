module Esa
  class Client
    module Stats
      # GET /v1/teams/:team_name/stats
      def get_stats(params = {}, headers = nil)
        get("/v1/teams/#{team}/stats", params, headers)
      end
    end
  end
end