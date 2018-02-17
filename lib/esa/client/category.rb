module Esa
  class Client
    module Category
      def move_category(params, headers = nil)
        request('POST', "v1/teams/#{team}/categories/batch_move", params, headers)
      end
    end
  end
end