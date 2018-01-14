FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password 'qwerty'
  end
end