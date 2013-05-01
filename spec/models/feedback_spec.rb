require 'spec_helper'

describe Feedback do
	it "has a valid factory" do
		FactoryGirl.create(:feedback).should be_valid
	end

	describe "dealing with ratings" do

		it "should have a rating and a comment" do
			user = FactoryGirl.create(:user)
			feedback = FactoryGirl.create(:feedback, user: user)
			feedback.user.should be_valid
			feedback.rating.should be >= 1
			feedback.rating.should be <= 3
		end
	end
end
