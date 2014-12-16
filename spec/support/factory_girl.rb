RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  # additional factory_girl configuration

  config.before(:suite) { FactoryGirl.lint }
end
