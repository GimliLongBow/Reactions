class User < ActiveRecord::Base
	include Clearance::User

	validates :name, :presence => true
	validates :email, :presence => true

	has_many :feedback

	def average_rating
		avg = 0
		if feedback.count > 0
			feedback.each {|f| avg += f.rating}
			avg = avg / feedback.count
		end
		return avg
	end
end
