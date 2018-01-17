FactoryBot.define do
  factory :recipe do
    title {Faker::Food.unique.dish}
    difficulty 'Fácil'
    cook_time {Faker::Number.number(2)}
    ingredients {Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient}
    recipe_type
    add_attribute(:method) {'Mistura e tudo e seja feliz'}
    cuisine
    user
  end
end
