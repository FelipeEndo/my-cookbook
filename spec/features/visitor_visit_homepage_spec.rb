require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'CookBook')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior livro de receitas online')
  end

  scenario 'and view recipe' do
    #cria os dados necessários
    recipe = create(:recipe)

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h3', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end

  scenario 'and view recipes list' do
    Faker::UniqueGenerator.clear
    #cria os dados necessários
    recipes = create_list(:recipe, 10)
    
    visit root_path
    
    recipes.drop(4).each do |recipe|
    expect(page).to have_css('h3', text:  recipe.title)
    expect(page).to have_css('li', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).to have_css('li', text: "Tipo: #{recipe.recipe_type.name}")
    expect(page).to have_css('li', text: "Dificuldade: #{recipe.difficulty}")
    end
    
    recipes.take(4).each do |recipe|
    expect(page).not_to have_css('h3', text:  recipe.title)
    expect(page).not_to have_css('li', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).not_to have_css('li', text: "Tipo: #{recipe.recipe_type.name}")
    end  
  end
end
