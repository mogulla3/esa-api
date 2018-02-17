module Esa
  class Client
    module Category
      # POST v1/teams/:team_name/categories/batch_move
      def move_category(params, headers = nil)
        post("v1/teams/#{team}/categories/batch_move", params, headers)
      end
    end
  end
end