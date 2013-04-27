require 'faker'

FactoryGirl.define do
  factory :feedback do 
    description "talking with you about doing fun stuff."
    rating 1
    client_email { Faker::Internet.email }
  end
end
