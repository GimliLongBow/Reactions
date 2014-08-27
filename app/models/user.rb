class User < ActiveRecord::Base
	include Clearance::User

	validates :name, :presence => true
	validates :email, :presence => true

	has_many :reviews

	def average_rating
		reviews.count > 0 ? add_reviews / reviews.count : 0
	end

	def approval_rating
		reviews.count > 0 ? add_reviews / (reviews.count * 3) * 100 : 0
	end

	def self.highest_rated_users
		# Find the top 5 highest rated users.
	end

	private

	def add_reviews
		added_ratings = 0.0
		reviews.each {|f| added_ratings += f.rating}
		return added_ratings
	end
end
