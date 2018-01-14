require 'rails_helper'

feature 'User destroy recipe' do
  scenario 'successfully' do
    
    recipe = create(:recipe)
                          
    visit root_path
    click_on recipe.title
    click_on 'Excluir'
    
    expect(page).not_to have_css('h1', text: recipe.title)
    expect(page).not_to have_css('li', text: recipe.recipe_type.name)
    expect(page).not_to have_css('li', text: recipe.cuisine.name)
    expect(page).not_to have_css('li', text: recipe.difficulty)
    expect(page).not_to have_css('li', text: recipe.cook_time.to_s+' minutos')
    
  end
end 