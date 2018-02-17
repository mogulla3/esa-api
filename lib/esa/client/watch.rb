module Esa
  class Client
    module Watch
      def get_watchers(post_number, params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/posts/#{post_number}/watchers", params, headers)
      end

      def create_watch(post_number, params, headers = nil)
        request('POST', "/v1/teams/#{team}/posts/#{post_number}/watch", params, headers)
      end

      def delete_watch(post_number, headers = nil)
        request('DELETE', "/v1/teams/#{team}/posts/#{post_number}/watch", headers)
      end
    end
  end
end