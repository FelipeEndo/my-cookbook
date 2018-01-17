require 'rails_helper'

feature 'User choose favorites' do
  scenario 'by link in the page' do
    Faker::UniqueGenerator.clear
    user = create(:user)
    login_as(user, scope: :user)
    recipe = create(:recipe)
    another_recipe = create(:recipe)
    dif_another_recipe = create(:recipe)
    
    visit recipe_path(recipe)
    
    click_on 'Adicionar aos Favoritos'
    
    visit recipe_path(another_recipe)
    
    click_on 'Adicionar aos Favoritos'
    
    visit my_favorites_recipes_path
    
    expect(page).to have_link(recipe.title, href: recipe_path(recipe))
    expect(page).to have_link(another_recipe.title, href: recipe_path(another_recipe))
    
    expect(page).not_to have_link(dif_another_recipe.title, href: recipe_path(dif_another_recipe))

  end
  
  scenario 'and see link to remove favorite if is already favorited' do
    Faker::UniqueGenerator.clear
    user = create(:user)
    recipe = create(:recipe)
    Favorite.create(user: user, recipe: recipe)
    
    login_as(user, scope: :user)
    
    visit recipe_path(recipe)
    
    expect(page).to have_css('p', text: 'Remover dos Favoritos')
    
    expect(page).not_to have_css('p', text: 'Adicionar aos Favoritos')
  end
  
  scenario 'and remove from favorites' do
    Faker::UniqueGenerator.clear
    user = create(:user)
    recipe = create(:recipe)
    Favorite.create(user: user, recipe: recipe)
    
    login_as(user, scope: :user)
    
    visit recipe_path(recipe)
    
    click_on 'Remover dos Favoritos'
    
    expect(page).not_to have_css('p', text: 'Remover dos Favoritos')
    
    expect(page).to have_content('Receita removida dos favoritos.')
    expect(page).to have_css('p', text: 'Adicionar aos Favoritos')
  end
  
end