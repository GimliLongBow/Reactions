# spec/models/user_spec.rb
require 'spec_helper'

describe User do
	it "has a valid factory" do
		FactoryGirl.create(:user).should be_valid
	end
	it "is invalid without a firstname" do
		FactoryGirl.build(:user, name: nil).should_not be_valid
	end
	it "is invalid without an email" do 
		FactoryGirl.build(:user, email: nil).should_not be_valid
	end

	describe "feedback tests" do
		before :each do 
			@charlie = FactoryGirl.create(:user)
			@sally = FactoryGirl.create(:user)
			@lousyFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 1)
			@greatFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 3)
			@mediocreFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 2)
			@moreMediocreFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 2)
		end

		it "has associated feedback" do
			@lousyFeedback.user_id.should == @charlie.id
		end

		it "has an average rating of 2" do
			@charlie.average_rating.should == 2
		end

		it "has no rating" do
			@sally.average_rating.should == 0
		end
	end

end