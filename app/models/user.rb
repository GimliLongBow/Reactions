class User < ActiveRecord::Base
  include Clearance::User

  validates :name, :presence => true
  validates :email, :presence => true

  has_many :feedback
end
