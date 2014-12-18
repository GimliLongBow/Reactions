module ControllerMethods
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
end


RSpec.configure do |config|
  config.extend ControllerMethods, :type => :controller
end
