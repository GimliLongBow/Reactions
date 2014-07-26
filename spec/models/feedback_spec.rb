require 'spec_helper'

describe Feedback do
	it "has a valid factory" do
		expect(FactoryGirl.build(:feedback)).to be_valid
	end

	describe "ratings" do

		it "has a rating and a comment" do
			user = FactoryGirl.create(:user)
			feedback = FactoryGirl.create(:feedback, user: user)
			expect(feedback.user).to be_valid
			expect(feedback.rating).to be >= 1
			expect(feedback.rating).to be <= 3
		end
	end
end
