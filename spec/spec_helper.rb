require 'coveralls'
Coveralls.wear!

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require "capybara/rails"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Load the schema for in-memory tests.
if Rails.configuration.database_configuration['test']['database'] == ':memory:'
  puts "creating sqlite in memory database"
  load "#{Rails.root}/db/schema.rb"
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end
