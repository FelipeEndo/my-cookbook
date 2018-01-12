require 'rails_helper'

feature 'User destroy recipe' do
  scenario 'successfully' do
    
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    
    appetizer_type = RecipeType.create(name: 'Entrada')
    
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type:  appetizer_type,
                          cuisine: brazilian_cuisine, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
                          
    visit root_path
    click_on recipe.title
    click_on 'Excluir'
    
    expect(page).not_to have_css('h1', text: recipe.title)
    expect(page).not_to have_css('li', text: appetizer_type.name)
    expect(page).not_to have_css('li', text: brazilian_cuisine.name)
    expect(page).not_to have_css('li', text: recipe.difficulty)
    expect(page).not_to have_css('li', text: '50 minutos')
    
  end
end 