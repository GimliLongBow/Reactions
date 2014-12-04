class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy

  validates :name, :presence => true
  validates :email, :presence => true

  before_create :generate_permalink

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

  def generate_permalink
    self.permalink = loop do
      token = SecureRandom.urlsafe_base64
      break token unless User.exists?(permalink: token)
    end
  end
end
