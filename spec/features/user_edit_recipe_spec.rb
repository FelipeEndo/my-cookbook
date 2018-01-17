require 'rails_helper'

feature 'User update recipe' do
  scenario 'Button Edit only apears for the owners recipe' do
    user = create(:user, email: 'strange@gmail.com')
    recipe = create(:recipe, user: create(:user, email: 'owner@gmail.com'))
    
    login_as(user, :scope => :user)
    
    
    visit recipe_path(recipe)
    
    expect(page).not_to have_link('Editar')
  
  end
  scenario 'page asks for login of not the owner' do
    #cria os dados necessários
    user = create(:user, email: 'strange@gmail.com')
    recipe = create(:recipe, user: create(:user, email: 'owner@gmail.com'))
    login_as(user, :scope => :user)
    visit edit_recipe_path(recipe)
    
    expect(current_path).to eq root_path
    expect(page).to have_content('Você não tem permissão para isso!')
  end
        
  scenario 'successfully' do
    #cria os dados necessários

    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    dessert_type = RecipeType.create(name: 'Sobremesa')
    recipe = create(:recipe)
    login_as(recipe.user, :scope => :user) 

    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: 'Bolo de cenoura'
    select brazilian_cuisine.name, from: 'Cozinha'
    select dessert_type.name, from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Médio'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Cenoura, farinha, ovo, oleo de soja e chocolate'
    fill_in 'Como Preparar', with: 'Faça um bolo e uma cobertura de chocolate'

    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Bolo de cenoura')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: 'Sobremesa')
    expect(page).to have_css('p', text: 'Brasileira')
    expect(page).to have_css('p', text: 'Médio')
    expect(page).to have_css('p', text: '45 minutos')
    expect(page).to have_css('p', text:  'Cenoura, farinha, ovo, oleo de soja e chocolate')
    expect(page).to have_css('p', text: 'Faça um bolo e uma cobertura de chocolate')
  end

  scenario 'and all fields must be filled' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    recipe = create(:recipe)
    login_as(recipe.user, :scope => :user) 
    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: ''
    fill_in 'Dificuldade', with: ''
    fill_in 'Tempo de Preparo', with: ''
    fill_in 'Ingredientes', with: ''
    fill_in 'Como Preparar', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os dados da receita')
  end
end
