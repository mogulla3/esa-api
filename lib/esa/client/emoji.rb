module Esa
  class Client
    module Emoji
      # GET /v1/teams/:team_name/emojis
      def get_emojis(params = {}, headers = nil)
        get("/v1/teams/#{team}/emojis", params, headers)
      end

      # POST /v1/teams/:team_name/emojis
      # TODO: Support request with multipart/form-data
      def create_emojis(params, headers = nil)
        post("/v1/teams/#{team}/emojis", params, headers)
      end

      # DELETE /v1/teams/:team_name/emojis/:code
      def delete_emoji(code, headers = nil)
        delete("/v1/teams/#{team}/emojis/#{code}", headers)
      end
    end
  end
end