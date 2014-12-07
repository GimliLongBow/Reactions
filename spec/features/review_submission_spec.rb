require 'spec_helper'

describe "Review Submission Process", :type => :feature do

  before :example do
    create(:user, name: 'Test Person')
  end

  let(:test_person) { User.find_by_name 'Test Person' }

  context 'review with different ratings' do

    it 'submits a negative review for a user' do
      initial_review_count = Review.count
      visit add_reviews_path(test_person.permalink, 1)

      expect(Review.count).to be > initial_review_count
      expect(test_person.average_rating).to eq 1

      expect(page).to have_content 'Thanks for submitting your review!'
    end

    it 'submits a neutral review for a user' do
      initial_review_count = Review.count
      visit add_reviews_path(test_person.permalink, 2)

      expect(Review.count).to be > initial_review_count
      expect(test_person.average_rating).to eq 2

      expect(page).to have_content 'Thanks for submitting your review!'
    end

    it 'submits a positive review for a user' do
      initial_review_count = Review.count
      visit add_reviews_path(test_person.permalink, 3)

      expect(Review.count).to be > initial_review_count
      expect(test_person.average_rating).to eq 3

      expect(page).to have_content 'Thanks for submitting your review!'
    end
  end

end
