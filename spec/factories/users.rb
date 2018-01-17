FactoryBot.define do
  factory :user do
    email {Faker::Internet.unique.email}
    password {Faker::LordOfTheRings.character+'1234'} 
  end
end