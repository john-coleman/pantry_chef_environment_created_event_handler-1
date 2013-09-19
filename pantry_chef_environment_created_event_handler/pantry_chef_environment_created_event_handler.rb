module Wonga
  module Daemon
    class PantryChefEnvironmentCreatedEventHandler
      def initialize(api_client, logger)
        @api_client = api_client
        @logger = logger
      end

      def handle_message(message)
        @logger.info "Updating chef environment created status for team_id:#{message['team_id']}, Name:#{message['instance_name']}, chef_environment: #{message['chef_environment']}"
        id = message["team_id"]
        @api_client.send_post_request(
          "/api/teams/#{id}/chef_environments", 
          { 
            name: message["chef_environment"]
          }
        )
        @logger.info "Updating chef environment created status for team_id:#{message['team_id']} succeeded"
      end
    end
  end
end
