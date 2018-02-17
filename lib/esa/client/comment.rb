module Esa
  class Client
    module Comment
      def get_post_comments(post_number, params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/posts/#{post_number}/comments", params, headers)
      end

      def get_comment(comment_id, params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/comments/#{comment_id}", params, headers)
      end

      def get_team_comments(headers = nil)
        request('GET', "/v1/teams/#{team}/comments", params, headers)
      end

      def create_comment(post_number, params, headers = nil)
        request('POST', "/v1/teams/#{team}/posts/#{post_number}/comments", params, headers)
      end

      def update_comment(comment_id, params, headers = nil)
        request('PATCH', "/v1/teams/#{team}/comments/#{comment_id}", params, headers)
      end

      def delete_comment(comment_id, headers = nil)
        request('DELETE', "/v1/teams/#{team}/comments/#{comment_id}", headers)
      end
    end
  end
end