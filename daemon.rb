#!/usr/bin/env ruby
require 'rubygems'
require 'wonga/daemon'
require_relative 'pantry_chef_environment_created_event_handler/pantry_chef_environment_created_event_handler'

config_name = File.join(File.dirname(File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__), 'config', 'daemon.yml')
Wonga::Daemon.load_config(File.expand_path(config_name))
Wonga::Daemon.run(Wonga::Daemon::PantryChefEnvironmentCreatedEventHandler.new(Wonga::Daemon.pantry_api_client, Wonga::Daemon.logger))
