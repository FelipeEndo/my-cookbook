require 'rails_helper'

feature 'User choose favorites' do
  scenario 'by link in the page' do
    user = create(:user)
    login_as(user, :scope => :user)
    recipe = create(:recipe)
    another_recipe = create(:recipe, cuisine: create(:cuisine, name: 'Italiana'), recipe_type: create(:recipe_type, name: 'Sobremesa'), title:'Bananada', difficulty: 'Dificil', cook_time: 95)
    dif_another_recipe = create(:recipe, cuisine: create(:cuisine, name: 'Mexicana'),  recipe_type: create(:recipe_type, name: 'Prato Principal'), title:'Lasanha', difficulty: 'Médio', cook_time: 35)
    
    visit recipe_path(recipe)
    
    click_on 'Adicionar aos Favoritos'
    
    visit recipe_path(another_recipe)
    
    click_on 'Adicionar aos Favoritos'
    
    visit favorites_recipes_path
    
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
    
    expect(page).to have_css('h1', text: another_recipe.title)
    expect(page).to have_css('li', text: another_recipe.recipe_type.name)
    expect(page).to have_css('li', text: another_recipe.cuisine.name)
    expect(page).to have_css('li', text: another_recipe.difficulty)
    expect(page).to have_css('li', text: "#{another_recipe.cook_time} minutos")
    
    expect(page).not_to have_css('h1', text: dif_another_recipe.title)
    expect(page).not_to have_css('li', text: dif_another_recipe.recipe_type.name)
    expect(page).not_to have_css('li', text: dif_another_recipe.cuisine.name)
    expect(page).not_to have_css('li', text: dif_another_recipe.difficulty)
    expect(page).not_to have_css('li', text: "#{dif_another_recipe.cook_time} minutos")
  end
  
  scenario 'and see link to remove favorite if is already favorited' do
    user = create(:user)
    login_as(user, :scope => :user)
    recipe = create(:recipe)
   
    visit recipe_path(recipe)
    
    click_on 'Adicionar aos Favoritos'
    
    visit recipe_path(recipe)
    
    expect(page).to have_css('p', text: 'Remover dos Favoritos')
    
    expect(page).not_to have_css('p', text: 'Adicionar aos Favoritos')
  end
  
  scenario 'and remove from favorites' do
    user = create(:user)
    login_as(user, :scope => :user)
    recipe = create(:recipe)
  end
  
end