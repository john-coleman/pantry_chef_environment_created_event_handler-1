module Wonga
  module Daemon
    class PantryChefEnvironmentCreatedEventHandler
      def initialize(api_client, logger)
        @api_client = api_client
        @logger = logger
      end

      def handle_message(message)
        @logger.info "Updating chef environment created status for team_id:#{message['team_id']}, Name:#{message['instance_name']}, chef_environment: #{message['chef_environment']}"
        @api_client.send_put_request("/api/teams/#{message["team_id"]}/chef_environments/#{message["environment_id"]}", message)
      end
    end
  end
end
