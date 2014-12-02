require 'spec_helper'

describe "the admin user management process", :type => :feature do
  before :example do
    user = create(:user, name: 'Test Person')
    login_as(user, :scope => :user)

    create(:review, user: user)
  end

  let(:test_person) { User.find_by_name 'Test Person' }

  it "authorizes correct credentials" do
    visit '/admin'
    expect(page).to have_content 'Administrative'
  end

  it "checks for user on the index" do
    visit admin_users_path
    expect(page).to have_content test_person.name
  end


end
