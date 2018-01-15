FactoryBot.define do
  factory :cuisine do
    name {Faker::Name.cuisine}
  end
end
