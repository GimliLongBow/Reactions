require 'spec_helper'

describe "the admin user management process", :type => :feature do
  before :example do
    user = create(:user, name: 'Test Person')
    login_as(user, :scope => :user)
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

  context "adding a user" do
    it "adds a user" do
      name = Faker::Name.name

      visit new_admin_user_path
      fill_user_with(name, Faker::Internet.email, Faker::Internet.password)

      expect(page).to have_content name
    end

    it "adds an admin user" do
      name = Faker::Name.name

      visit new_admin_user_path
      fill_user_with(name, Faker::Internet.email, Faker::Internet.password, true)

      expect(page).to have_content name
    end

    it "checks login for new user" do
      password = Faker::Internet.password
      name = Faker::Name.name
      email = Faker::Internet.email

      visit new_admin_user_path
      fill_user_with(name, email, password)

      click_on 'Sign out'

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on 'Sign in'

      expect(page).to have_content 'Administrative'
    end
  end

  context "destroying a user" do
    it "destroys a user and removes associated reviews" do
      highly = create(:user, name: 'Highly Reviewed')
      highly_id = highly.id

      4.times do
        create(:review, user: highly, rating: 3)
      end

      visit admin_users_path
      click_on highly.name

      click_on 'Remove'

      expect(Review.where(user_id: highly_id).count).to equal 0
    end

  end

  context "editing a user" do
    it "edits the user" do
      name = Faker::Name.name
      create(:user, name: name)

      visit admin_users_path
      click_on name

      name2 = Faker::Name.name
      email2 = Faker::Internet.email
      password2 = Faker::Internet.password

      fill_user_with(name2, email2, password2)

      expect(page).to have_content name2
    end

    it "edits an email and password, logging in afterwards" do
      name = Faker::Name.name
      create(:user, name: name)

      visit admin_users_path
      click_on name

      name2 = Faker::Name.name
      email2 = Faker::Internet.email
      password2 = Faker::Internet.password

      fill_user_with(name2, email2, password2)

      click_on 'Sign out'

      fill_in 'Email', with: email2
      fill_in 'Password', with: password2
      click_on 'Sign in'

      expect(page).to have_content 'Administrative'
    end

  end

  private

  def fill_user_with(name, email, password, admin=false)

    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    find(:css, '#user_admin').set('true')

    click_on 'Save'
  end


end
