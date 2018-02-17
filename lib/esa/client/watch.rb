module Esa
  class Client
    module Watch
      # GET /v1/teams/:team_name/posts/:post_number/watchers
      def get_watchers(post_number, params = {}, headers = nil)
        get("/v1/teams/#{team}/posts/#{post_number}/watchers", params, headers)
      end

      # POST /v1/teams/:team_name/posts/:post_number/watch
      def create_watch(post_number, params, headers = nil)
        post("/v1/teams/#{team}/posts/#{post_number}/watch", params, headers)
      end

      # DELETE /v1/teams/:team_name/posts/:post_number/watch
      def delete_watch(post_number, headers = nil)
        delete("/v1/teams/#{team}/posts/#{post_number}/watch", headers)
      end
    end
  end
end