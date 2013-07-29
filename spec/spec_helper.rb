PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app KreuzOMat::App
#   app KreuzOMat::App.tap { |a| }
#   app(KreuzOMat::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end

def load_yaml_fixtures file
  YAML.load_file File.expand_path(file, File.join(File.dirname(__FILE__), "fixtures"))
end

require 'capybara/rspec'
require "capybara/poltergeist"
# Capybara.default_driver = :webkit
Capybara.javascript_driver = :poltergeist
Capybara.app = app
