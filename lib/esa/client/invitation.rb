module Esa
  class Client
    module Invitation
      # GET /v1/teams/:team_name/invitation
      def get_invitation_url(params = {}, headers = nil)
        get("/v1/teams/#{team}/invitation", params, headers)
      end

      # POST /v1/teams/:team_name/invitation_regenerator
      def regenerate_invitation_url(params, headers = nil)
        post("/v1/teams/#{team}/invitation_regenerator", params, headers)
      end

      # POST /v1/teams/:team_name/invitations
      def send_invitation_mail(params, headers = nil)
        post("/v1/teams/#{team}/invitations", params, headers)
      end

      # GET /v1/teams/:team_name/invitations
      def get_invited_users(params = {}, headers = nil)
        get("/v1/teams/#{team}/invitations", params, headers)
      end

      # DELETE /v1/teams/:team_name/invitations/:code
      def delete_invitation(code, headers = nil)
        delete("/v1/teams/#{team}/invitations/#{code}", headers = nil)
      end
    end
  end
end