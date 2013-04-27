class Feedback < ActiveRecord::Base
  attr_accessible :client_email, :description, :rating
end
