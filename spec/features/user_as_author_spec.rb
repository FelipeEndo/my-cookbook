require 'rails_helper'

feature 'Recipe with author' do
  scenario 'Recipe show the author' do
    #cria os dados necessários
    recipe = create(:recipe)
    
    visit recipe_path(recipe)
    
    expect(page).to have_css('p', text: 'Autor: '+recipe.user.email)
  end
  
    scenario 'and can see edit button if is the author' do
    #cria os dados necessários
    user = create(:user)
    recipe = create(:recipe, user: user)
    login_as(user, :scope => :user)
    visit recipe_path(recipe)

    
    expect(page).to have_link('Editar')
    expect(page).to have_link('Excluir')
  end
  
      scenario 'and cant see edit button if is not the author' do
    #cria os dados necessários
    strange_user = create(:user)
    recipe = create(:recipe)
    login_as(strange_user, :scope => :user)
    visit recipe_path(recipe)

    
    expect(page).not_to have_link('Editar')
    expect(page).not_to have_link('Excluir')
  end
end