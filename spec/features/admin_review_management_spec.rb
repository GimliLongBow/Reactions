require 'spec_helper'

describe "the admin review management process", :type => :feature do
  before :example do
    user = create(:user, name: 'Test Person')
    login_as(user, :scope => :user)

    create(:review, user: user)
  end

  before :each do
    visit admin_reviews_path
  end

  let(:test_person) { User.find_by_name 'Test Person' }

  it "authorizes correct credentials" do
    visit '/admin'
    expect(page).to have_content 'Administrative'
  end

  it "checks for review on index" do
    expect(page).to have_content test_person.name
  end

  context "adding a review" do
    it "adds a new review " do
      click_on 'New review'
    end

    it "adds a review with invalid rating"
  end

  context "removing a review" do
    it "removes a review"
  end

  context "editing a review" do
    it "edits a review"
  end


end
