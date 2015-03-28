require 'middleman'
require 'rspec'
require 'capybara/rspec'

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

Capybara.app = Middleman::Application.server.inst do
  set :root, APP_ROOT
  set :environment, :development
  set :show_exceptions, false
end
