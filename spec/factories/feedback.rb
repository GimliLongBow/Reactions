require 'faker'

FactoryGirl.define do
  factory :feedback do 
    comment { Faker::Lorem.paragraph() }
    rating { Random.rand(1..3) }
  end
end
