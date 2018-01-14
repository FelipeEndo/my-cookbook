require 'rails_helper'

feature 'User edits own recipe' do
  scenario 'Button Edit only apears on owners recipe' do
    user = create(:user, email: 'strange@gmail.com')
    recipe = create(:recipe)
    
    login_as(user, :scope => :user)
    
    
    visit recipe_path(recipe)
    
    expect(page).not_to have_link('Editar')
  
  end
  scenario 'page asks for login' do
    #cria os dados necessários
    user = create(:user, email: 'strange@gmail.com')
    recipe = create(:recipe)
    
    visit recipe_path(recipe)
    
    expect(page).to have_css('p', text: 'Autor: '+recipe.user.email)
  end
end