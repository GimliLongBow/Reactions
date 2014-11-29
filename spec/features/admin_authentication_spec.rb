require 'spec_helper'

describe "the admin authentication process", :type => :feature do
  before :example do
    User.create!(:name => "Charlie", :email => 'user@example.com', :password => 'caplin')
  end

  it "authorizes correct credentials" do
    visit '/sign_in'
    within("#clearance") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Administrative'
  end

  it "rejects incorrect credentials" do
    visit '/sign_in'
    within("#clearance") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'daplin'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Administrative'
  end

  it "protects admin section" do
      visit '/admin'
      expect(page).to have_content 'Log in'
  end
end
