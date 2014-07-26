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

	describe "feedback tests" do
		before(:example) do 
			@charlie = FactoryGirl.create(:user)
			@sally = FactoryGirl.create(:user)
			@lousyFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 1)
			@greatFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 3)
			@mediocreFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 3)
			@moreMediocreFeedback = FactoryGirl.create(:feedback, user: @charlie, rating: 2)
		end

		it "has associated feedback" do
			expect(@lousyFeedback.user_id).to equal(@charlie.id)
		end

		it "has no rating" do
			expect(@sally.average_rating).to equal(0)
		end

		it "has an average rating of 2.25" do
			expect(@charlie.average_rating).to equal(2.25)
		end

		it "has a zero percent approval rating" do 
			expect(@sally.approval_rating).to equal(0)
		end

		it "has an approval rating of 75/100" do
			expect(@charlie.approval_rating).to equal(75.0)
		end


	end

end