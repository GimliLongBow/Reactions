require 'spec_helper'

describe "the admin authentication process", :type => :feature do
  before :example do
    User.create!(:name => "Charlie", :email => 'user@example.com', :password => 'caplin1234')
  end

  it "authorizes correct credentials" do
    visit '/'
    within(".new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin1234'
    end

    click_button 'Sign in'
    expect(page).to have_content 'Administrative'
  end

  it "rejects incorrect credentials" do
    visit '/'
    within(".new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'daplin1234'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Sign in'
  end

  it "protects admin section" do
      visit '/admin'
      expect(page).to have_content 'Sign in'
  end
end
