require 'spec_helper'
require_relative '../../pantry_chef_environment_created_event_handler/pantry_chef_environment_created_event_handler'

describe Wonga::Daemon::PantryChefEnvironmentCreatedEventHandler do
  let(:api_client) { instance_double('Wonga::Daemon::PantryApiClient').as_null_object }
  let(:logger) { instance_double('Logger').as_null_object }
  subject { described_class.new(api_client,logger) }
  let(:message) {
    {
      "user_id" => 1,
      "team_id" => 42,
      "chef_environment" => "some value"
    }
  }
  it_behaves_like "handler"

  it "updates Pantry using PantryApiClient" do
    expect(api_client).to receive(:send_post_request).with(
      "/api/teams/42/chef_environments",
      {
        "user_id" => 1,
        "team_id" => 42,
        "chef_environment" => "some value",
        :name => "some value"
      }
    )
    subject.handle_message(message)
  end
end

