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

      fill_in 'Rating', with: 3
      fill_in 'Comment', with: Faker::Lorem.paragraph
      select test_person.name, :from => 'User'

      click_on 'Save'

      expect(page).to have_content test_person.name, count: 2
    end

    it "adds a review with invalid rating" do
      click_on 'New review'

      fill_in 'Rating', with: 5
      fill_in 'Comment', with: Faker::Lorem.paragraph
      select test_person.name, :from => 'User'

      click_on 'Save'

      expect(page).to have_text "less than or equal"
    end
  end

  context "removing a review" do
    it "removes a review" do
      click_on test_person.name
      click_on 'Remove'

      expect(page).not_to have_content test_person.name
    end
  end

  context "editing a review" do
    it "edits a rating" do
      click_on test_person.name

      fill_in 'Rating', with: 3
      fill_in 'Comment', with: Faker::Lorem.paragraph

      click_on 'Save'

      expect(page).to have_content 3

    end
  end


end
