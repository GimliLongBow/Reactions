RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, :type => :controller

  # Set up authentication test mode.
  Warden.test_mode!
end
