require 'spec_helper'
require 'json'

RSpec.describe Esa::Client do
  describe '#initialize' do
    context 'when team_name is not specified and request API using team_name' do
      it 'raise RuntimeError' do
        esa = Esa::Client.new(access_token: 'access_token')
        expect { esa.get_team }.to raise_error(RuntimeError, "team_name must be specified")
      end
    end
  end

  describe '#request' do
    context 'when request is success' do
      it 'return a Esa::Response' do
        team_name = "myteam"
        access_token = "access_token"

        stub_request(:get, "#{Esa::Client::END_POINT}/v1/teams/#{team_name}")
          .with(headers: { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{access_token}" })
          .to_return(status: 200)

        esa = Esa::Client.new do |c|
          c.team_name = team_name
          c.access_token = access_token
        end

        expect(esa.get_team).to be_a_kind_of(Esa::Response)
      end
    end
  end
end