require 'spec_helper'

describe "the admin review management process", :type => :feature do
  before :example do
    User.create!(:name => "Charlie", :email => 'user@example.com', :password => 'caplin')
  end

  it "authorizes correct credentials"

private
  def login
  end
end
