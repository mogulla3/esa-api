module Esa
  class Client
    module Member
      def get_members(params = {}, headers = nil)
        get("/v1/teams/#{team}/members", params, headers)
      end
    end
  end
end