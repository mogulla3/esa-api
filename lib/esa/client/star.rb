module Esa
  class Client
    module Star
      # GET /v1/teams/:team_name/posts/:post_number/stargazers
      def get_post_stargazers(post_number, params = {}, headers = nil)
        get("/v1/teams/#{team}/posts/#{post_number}/stargazers", params, headers)
      end

      # POST /v1/teams/:team_name/posts/:post_number/star
      def create_post_star(post_number, params, headers = nil)
        post("/v1/teams/#{team}/posts/#{post_number}/star", params, headers)
      end

      # DELETE /v1/teams/:team_name/posts/:post_number/star
      def delete_post_star(post_number, headers = nil)
        delete("/v1/teams/#{team}/posts/#{post_number}/star", headers)
      end

      # GET /v1/teams/:team_name/comments/:comment_id/stargazers
      def get_comment_stargazers(comment_id, params = {}, headers = nil)
        get("/v1/teams/#{team}/comments/#{comment_id}/stargazers", params, headers)
      end

      # POST /v1/teams/:team_name/comments/:comment_id/star
      def create_comment_star(comment_id, params, headers = nil)
        post("/v1/teams/#{team}/comments/#{comment_id}/star", params, headers)
      end

      # DELETE /v1/teams/:team_name/comments/:comment_id/star
      def delete_comment_star(comment_id, headers = nil)
        delete("/v1/teams/#{team}/comments/#{comment_id}/star", headers)
      end
    end
  end
end
