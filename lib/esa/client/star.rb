module Esa
  class Client
    module Star
      def get_post_stargazers(post_number, params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/posts/#{post_number}/stargazers", params, headers)
      end

      def create_post_star(post_number, params, headers = nil)
        request('POST', "/v1/teams/#{team}/posts/#{post_number}/star", params, headers)
      end

      def delete_post_star(post_number, headers = nil)
        request('DELETE', "/v1/teams/#{team}/posts/#{post_number}/star", headers)
      end

      def get_comment_stargazers(comment_id, params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/comments/#{comment_id}/stargazers", params, headers)
      end

      def create_comment_star(comment_id, params, headers = nil)
        request('POST', "/v1/teams/#{team}/comments/#{comment_id}/star", params, headers)
      end

      def delete_comment_star(comment_id, headers = nil)
        request('DELETE', "/v1/teams/#{team}/comments/#{comment_id}/star", headers)
      end
    end
  end
end
