# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do |f|
  	f.first_name { Faker::Name.first_name }
  	f.last_name { Faker::Name.last_name }
  	f.company_name { Faker::Company.name }
  	f.email { Faker::Internet.email }
  end
end
