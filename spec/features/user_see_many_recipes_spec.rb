require 'rails_helper'

feature 'User see recipes' do
  scenario 'In homepage' do
    #cria os dados necessários
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)
    recipe3 = create(:recipe)
    recipe4 = create(:recipe)
    recipe5 = create(:recipe)
    recipe6 = create(:recipe)
    
    visit root_path
    
    expect(page).to have_css('h3', text:  recipe1.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe1.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe1.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe1.difficulty)
    
    expect(page).to have_css('h3', text:  recipe2.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe2.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe2.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe2.difficulty)
    
    expect(page).to have_css('h3', text:  recipe3.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe3.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe3.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe3.difficulty)
    
    expect(page).to have_css('h3', text: recipe4.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe4.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe4.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe4.difficulty)
    
    expect(page).to have_css('h3', text: recipe5.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe5.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe5.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe5.difficulty)
    
    expect(page).to have_css('h3', text: recipe6.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe6.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe6.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe6.difficulty)
  
    
  end
  
  scenario 'In recipes page' do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)
    recipe3 = create(:recipe)
    recipe4 = create(:recipe)
    recipe5 = create(:recipe)
    recipe6 = create(:recipe)
    recipe7 = create(:recipe)
    recipe8 = create(:recipe)
    
    visit root_path
    click_on 'Todas as Receitas'
    
    expect(page).to have_css('h1', text: 'Listagem de Receitas')
    
    expect(page).to have_css('h3', text:  recipe1.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe1.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe1.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe1.difficulty)
    
    expect(page).to have_css('h3', text:  recipe2.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe2.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe2.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe2.difficulty)
    
    expect(page).to have_css('h3', text:  recipe3.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe3.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe3.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe3.difficulty)
    
    expect(page).to have_css('h3', text:  recipe4.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe4.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe4.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe4.difficulty)
    
    expect(page).to have_css('h3', text:  recipe5.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe5.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe5.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe5.difficulty)
    
    expect(page).to have_css('h3', text:  recipe6.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe6.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe6.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe6.difficulty)
    
    expect(page).to have_css('h3', text:  recipe7.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe7.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe7.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe7.difficulty)
    
    expect(page).to have_css('h3', text:  recipe8.title)
    expect(page).to have_css('li', text: 'Cozinha: '+recipe8.cuisine.name)
    expect(page).to have_css('li', text: 'Tipo: '+recipe8.recipe_type.name)
    expect(page).to have_css('li', text: 'Dificuldade: '+recipe8.difficulty)
    
    
    
  end
end