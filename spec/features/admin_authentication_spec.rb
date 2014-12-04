require 'spec_helper'

describe "the admin authentication process", :type => :feature do
  before :example do
    create(:user, name: 'Charlie', email: 'user@example.com', password: 'caplin1234')
  end

  let(:charlie) { User.find_by_email 'user@example.com' }

  it "authorizes correct credentials" do
    visit '/'

    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'caplin1234'

    click_button 'Sign in'
    expect(page).to have_content 'Administrative'
  end

  it "rejects incorrect credentials" do
    visit '/'

    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'daplin1234'

    click_button 'Sign in'
    expect(page).to have_content 'Sign in'
  end

  it "protects admin section" do
      visit '/admin'
      expect(page).to have_content 'Sign in'
  end

  it "logs out an authenticated user" do
    login_as(charlie, :scope => :user)
    visit '/admin'

    click_on 'Sign out'

    expect(page).not_to have_content 'Sign out'
  end
end
