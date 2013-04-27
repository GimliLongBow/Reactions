class Feedback < ActiveRecord::Base
  attr_accessible :client_email, :description, :rating

  belongs_to :user
end
