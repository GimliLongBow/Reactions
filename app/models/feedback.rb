class Feedback < ActiveRecord::Base
  attr_accessible :client_email, :description, :rating

  validates :rating, :presence => true

  belongs_to :user
end
