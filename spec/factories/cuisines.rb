FactoryBot.define do
  factory :cuisine do
    name {Faker::Name.unique.cuisine}
  end
end
