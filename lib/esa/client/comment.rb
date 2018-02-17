module Esa
  class Client
    module Comment
      # GET /v1/teams/:team_name/posts/:post_number/comments
      def get_post_comments(post_number, params = {}, headers = nil)
        get("/v1/teams/#{team}/posts/#{post_number}/comments", params, headers)
      end

      # GET /v1/teams/:team_name/comments/:comment_id
      def get_comment(comment_id, params = {}, headers = nil)
        get("/v1/teams/#{team}/comments/#{comment_id}", params, headers)
      end

      # GET /v1/teams/:team_name/comments
      def get_team_comments(headers = nil)
        get("/v1/teams/#{team}/comments", params, headers)
      end

      # POST /v1/teams/:team_name/posts/:post_number/comments
      def create_comment(post_number, params, headers = nil)
        post("/v1/teams/#{team}/posts/#{post_number}/comments", params, headers)
      end

      # PATCH /v1/teams/:team_name/comments/:comment_id
      def update_comment(comment_id, params, headers = nil)
        patch("/v1/teams/#{team}/comments/#{comment_id}", params, headers)
      end

      # DELETE /v1/teams/:team_name/comments/:comment_id
      def delete_comment(comment_id, headers = nil)
        delete("/v1/teams/#{team}/comments/#{comment_id}", params, headers)
      end
    end
  end
end