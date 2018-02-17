module Esa
  class Client
    module Invitation
      def get_invitation_url(params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/invitation", params, headers)
      end

      def regenerate_invitation_url(params, headers = nil)
        request('POST', "/v1/teams/#{team}/invitation_regenerator", params, headers)
      end

      def send_invitation_mail(params, headers = nil)
        request('POST', "/v1/teams/#{team}/invitations", params, headers)
      end

      def get_invited_users(params = {}, headers = nil)
        request('GET', "/v1/teams/#{team}/invitations", params, headers)
      end

      def delete_invitation(code, headers = nil)
        request('DELETE', "/v1/teams/#{team}/invitations/#{code}", headers = nil)
      end
    end
  end
end