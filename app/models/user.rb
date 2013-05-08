class User < ActiveRecord::Base
	include Clearance::User

	validates :name, :presence => true
	validates :email, :presence => true

	has_many :feedback

	def average_rating
		feedback.count > 0 ? add_ratings / feedback.count : 0
	end

	def approval_rating
		feedback.count > 0 ? add_ratings / (feedback.count * 3) * 100 : 0
	end

	def add_ratings
		added_ratings = 0.0
		feedback.each {|f| added_ratings += f.rating}
		return added_ratings
	end
end
