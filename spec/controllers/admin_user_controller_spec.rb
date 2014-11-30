require 'spec_helper'

RSpec.describe Admin::ReviewsController, :type => :controller do
  login_user

  before(:example) do
    create(:user, name: 'Test Person')
  end

  let(:test_person) { User.find_by_name 'Test Person' }

  it "should have a current_user" do
    expect(subject.current_user).not_to be_nil
  end

  it "should have a review listed on the index" do
    # create(:review, user: test_person)
    # Test the index to make sure the test_person name is in the response. 
  end

end
