require 'rails_helper'

feature 'user send email' do 
  scenario 'recomending a recipe' do
   recipe = create(:recipe)
   user = create(:user)
   
   visit recipe_path(recipe.id)
   
   fill_in 'Seu nome', with: 'Felipe'
   fill_in 'Email', with: 'friend@email.com'
   fill_in 'Mensagem', with: 'Veja essa receita!!'
   
   expect(UserMailer).to receive(:recommend_email).with('friend@email.com', 'Veja essa receita!!', recipe.id).and_call_original
      
   click_on 'Enviar'
   

   
    expect(page).to have_content 'Receita enviada para friend@email.com'
    expect(current_path).to eq recipe_path(recipe)
    mail = ActionMailer::Base.deliveries.last
    expect(mail.to).to include 'friend@email.com'
    expect(mail.subject).to eq 'Compartilharam uma receita com você'
    expect(mail.body).to include 'Veja essa receita!!'
    expect(mail.body).to include recipe_url(recipe, host: 'localhost:3000')
  end

  
end