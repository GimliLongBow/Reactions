describe "the admin authentication process", :type => :feature do
  before :example do
    User.make(:email => 'user@example.com', :password => 'caplin')
  end

  it "authorizes correct credentials" do
    visit '/sign_in'
    within("#clearance") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end

  it "rejects incorrect credentials"
end
