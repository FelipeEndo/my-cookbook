require 'rails_helper'

feature 'User destroy recipe' do
  scenario 'successfully' do
    
    recipe = create(:recipe)
    login_as(recipe.user, :scope => :user)                     
    visit root_path
    click_on recipe.title
    click_on 'Excluir'
    
    
    expect(Recipe.exists?(recipe.id)).to be false
    
  end
end 