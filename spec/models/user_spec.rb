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
	it "has a name, email, and associated incidents" do
		user = FactoryGirl.create(:user)
		user
		# Create an incident.
		# Validate the incident
		user.should be_valid
	end
end