require 'spec_helper'

describe Review do
	it "has a valid factory" do
		expect(FactoryGirl.build(:review)).to be_valid
	end

	describe "ratings" do

		it "has a rating and a comment" do
			user = FactoryGirl.create(:user)
			review = FactoryGirl.create(:review, user: user)
			expect(review.user).to be_valid
			expect(review.rating).to be >= 1
			expect(review.rating).to be <= 3
		end
	end
end
