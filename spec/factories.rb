require 'faker'

FactoryGirl.define do
  
  factory :feedback do
    comment { Faker::Lorem.paragraph() }
    rating { Random.rand(1..3) }
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Base.bothify("SomeSuperLongPasswordString") }
  end
end
