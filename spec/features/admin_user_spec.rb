require 'spec_helper'

describe "the admin user process", :type => :feature do
  before :example do
    User.create!(:name => "Charlie", :email => 'user@example.com', :password => 'caplin')
  end

  it "allows login as administrative user"

  it "allows user to be created with valid info"

  it "prevents user from being created with invalid info"

  it "allows administrative user to be created"

  it "shows correct user info on index"

  it "allows login as normal user"

  it "shows feedback info for the current user"

  def login

  end
end
