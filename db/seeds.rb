# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type1 = RecipeType.create(name: Faker::Name.unique.recipe_type)
type2 = RecipeType.create(name: Faker::Name.unique.recipe_type)
type3 = RecipeType.create(name: Faker::Name.unique.recipe_type)
type4 = RecipeType.create(name: Faker::Name.unique.recipe_type)
type5 = RecipeType.create(name: Faker::Name.unique.recipe_type)

cuisine1 = Cuisine.create(name: Faker::Name.unique.cuisine)
cuisine2 = Cuisine.create(name: Faker::Name.unique.cuisine)
cuisine3 = Cuisine.create(name: Faker::Name.unique.cuisine)
cuisine4 = Cuisine.create(name: Faker::Name.unique.cuisine)
cuisine5 = Cuisine.create(name: Faker::Name.unique.cuisine)

user1 = User.create(email: Faker::Internet.unique.email, password: Faker::LordOfTheRings.character+'1234')
user2 = User.create(email: Faker::Internet.unique.email, password: Faker::LordOfTheRings.character+'1234')
user3 = User.create(email: Faker::Internet.unique.email, password: Faker::LordOfTheRings.character+'1234')
user4 = User.create(email: Faker::Internet.unique.email, password: Faker::LordOfTheRings.character+'1234')
user5 = User.create(email: Faker::Internet.unique.email, password: Faker::LordOfTheRings.character+'1234')

recipe1 = Recipe.create(title: Faker::Food.unique.dish, 
              difficulty: Faker::Name.difficulty, 
              cook_time: Faker::Number.number(2),
              ingredients: Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient,
              recipe_type: type1,
              cuisine: cuisine1,
              method: Faker::Lorem.sentence,
              user: user1)
              
recipe2 = Recipe.create(title: Faker::Food.unique.dish, 
              difficulty: Faker::Name.difficulty, 
              cook_time: Faker::Number.number(2),
              ingredients: Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient,
              recipe_type: type2,
              cuisine: cuisine2,
              method: Faker::Lorem.sentence,
              user: user2)
              
recipe3 = Recipe.create(title: Faker::Food.unique.dish, 
              difficulty: Faker::Name.difficulty, 
              cook_time: Faker::Number.number(2),
              ingredients: Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient,
              recipe_type: type3,
              cuisine: cuisine3,
              method: Faker::Lorem.sentence,
              user: user3)
              
recipe4 = Recipe.create(title: Faker::Food.unique.dish, 
              difficulty: Faker::Name.difficulty, 
              cook_time: Faker::Number.number(2),
              ingredients: Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient,
              recipe_type: type4,
              cuisine: cuisine4,
              method: Faker::Lorem.sentence,
              user: user4)  
              
recipe5 = Recipe.create(title: Faker::Food.unique.dish, 
              difficulty: Faker::Name.difficulty, 
              cook_time: Faker::Number.number(2),
              ingredients: Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient+', '+Faker::Food.ingredient,
              recipe_type: type5,
              cuisine: cuisine5,
              method: Faker::Lorem.sentence,
              user: user5)
              
Favorite.create(user: user1, recipe: recipe1)
Favorite.create(user: user1, recipe: recipe2)
Favorite.create(user: user1, recipe: recipe3)

Favorite.create(user: user2, recipe: recipe1)
Favorite.create(user: user2, recipe: recipe2)

Favorite.create(user: user3, recipe: recipe1)
Favorite.create(user: user3, recipe: recipe4)

Favorite.create(user: user4, recipe: recipe1)
Favorite.create(user: user4, recipe: recipe4)
Favorite.create(user: user4, recipe: recipe5)

Favorite.create(user: user5, recipe: recipe1)
Favorite.create(user: user5, recipe: recipe4)
Favorite.create(user: user5, recipe: recipe3)
            

