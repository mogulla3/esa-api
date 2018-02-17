module Esa
  class Client
    module Post
      def get_post(post_number, params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/posts/#{post_number}", params, headers)
      end

      def get_posts(params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/posts", params, headers)
      end

      def create_post(params, headers = nil)
        request('POST', "/v1/teams/#{team}/posts", params, headers)
      end

      def update_post(post_number, params, headers = nil)
        request('PATCH', "/v1/teams/#{team}/posts/#{post_number}", params, headers)
      end

      def delete_post(post_number, headers = nil)
        request('DELETE', "/v1/teams/#{team}/posts/#{post_number}", nil, headers)
      end
    end
  end
end
