module Esa
  class Client
    module Team
      def get_teams(params = {}, headers = nil)
        get('/v1/teams', params, headers)
      end

      def get_team(params = {}, headers = nil)
        get("/v1/teams/#{team}", params, headers)
      end
    end
  end
end
