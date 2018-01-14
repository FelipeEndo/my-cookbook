require 'rails_helper'

feature 'Recipe with author' do
  scenario 'Recipe show the author' do
    #cria os dados necessários
    recipe = create(:recipe)
    
    visit recipe_path(recipe)
    
    expect(page).to have_css('p', text: 'Autor: '+recipe.user.email)
  end
end