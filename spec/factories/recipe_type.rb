FactoryBot.define do
  factory :recipe_type do
    name {Faker::Name.unique.recipe_type}
    end
end
