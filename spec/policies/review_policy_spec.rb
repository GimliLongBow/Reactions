require 'spec_helper'

describe ReviewPolicy do

  let(:admin) { create(:user, admin: true) }
  let(:user) { create(:user) }

  let(:scope) { Review.all }
  subject(:policy_scope) { ReviewPolicy::Scope.new(user, scope).resolve }

  subject { described_class }

  permissions '.scope' do

    it 'allows admins to view all reviews' do
      3.times do
        create(:review)
      end

      expect(ReviewPolicy::Scope.new(admin, scope).resolve.length).to eq 3
    end

    it 'allows users to only view their own reviews' do
      3.times do
        create(:review, user: admin)
      end

      3.times do
        create(:review, user: user)
      end

      expect(ReviewPolicy::Scope.new(user, scope).resolve.length).to eq 3
    end

  end

  permissions :create? do
    it "allows admins to create a new review" do
      expect(subject).to permit(admin, Review.new)
    end

    it "does not permit normal users to create a new review" do
      expect(subject).not_to permit(user, Review.new)
    end
  end

  permissions :show? do
    it "allows admins to see a review for any user" do
      review = create(:review, user: user)
      expect(subject).to permit(admin, review)
    end

    it "allows users to view their own reviews" do
      review = create(:review, user: user)
      expect(subject).to permit(user, review)
    end

    it "does not allow users to view other reviews" do
      review = create(:review, user: admin)
      expect(subject).not_to permit(user, review)
    end
  end

  permissions :update? do
    it "allows admins to update a review" do
      review = create(:review)
      expect(subject).to permit(admin, review.update(rating: 2))
    end

    it "does not permit normal users to update a review" do
      review = create(:review)
      expect(subject).not_to permit(user, review.update(rating: 2))
    end
  end

  permissions :destroy? do
    it "allows admins to delete a review" do
      review = create(:review)
      expect(subject).to permit(admin, review.destroy)
    end

    it "does not permit normal users to delete a review" do
      review = create(:review)
      expect(subject).not_to permit(user, review.destroy)
    end
  end
end
