module Esa
  class Client
    module Emoji
      def get_emojis(params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/emojis", params, headers)
      end

      # TODO: Support request with multipart/form-data
      def create_emojis(params, headers = nil)
        request('POST', "/v1/teams/#{team}/emojis", params, headers)
      end

      def delete_emoji(code, headers = nil)
        request('DELETE', "/v1/teams/#{team}/emojis/#{code}", headers)
      end
    end
  end
end