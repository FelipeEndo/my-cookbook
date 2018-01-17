require 'rails_helper'

feature 'User see all recipes' do
  
  scenario 'In recipes page' do
    Faker::UniqueGenerator.clear
    recipes = create_list(:recipe, 10)
    
    visit root_path
    click_on 'Todas as Receitas'
    
    expect(page).to have_css('h1', text: 'Todas as Receitas')
    
    recipes.each do |recipe|
    expect(page).to have_css('h3', text:  recipe.title)
    expect(page).to have_css('li', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).to have_css('li', text: "Tipo: #{recipe.recipe_type.name}")
    expect(page).to have_css('li', text: "Dificuldade: #{recipe.difficulty}")
    end
    
    
  end
end