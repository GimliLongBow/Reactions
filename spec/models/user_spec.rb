# spec/models/user_spec.rb
require 'spec_helper'

describe User do
	it "has a valid factory" do
		expect(FactoryGirl.build(:user)).to be_valid
	end
	it "is invalid without a firstname" do
		expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
	end
	it "is invalid without an email" do
		expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
	end

	describe "review tests" do
		before(:example) do
			@charlie = FactoryGirl.create(:user)
			@sally = FactoryGirl.create(:user)
			@lousyReview = FactoryGirl.create(:review, user: @charlie, rating: 1)
			@greatReview = FactoryGirl.create(:review, user: @charlie, rating: 3)
			@mediocreReview = FactoryGirl.create(:review, user: @charlie, rating: 3)
			@moreMediocreReview = FactoryGirl.create(:review, user: @charlie, rating: 2)
		end

		it "has associated review" do
			expect(@lousyReview.user_id).to eq(@charlie.id)
		end

		it "has no rating" do
			expect(@sally.average_rating).to eq(0)
		end

		it "has an average rating of 2.25" do
			expect(@charlie.average_rating).to eq(2.25)
		end

		it "has a zero percent approval rating" do
			expect(@sally.approval_rating).to eq(0)
		end

		it "has an approval rating of 75/100" do
			expect(@charlie.approval_rating).to eq(75.0)
		end


	end

end
