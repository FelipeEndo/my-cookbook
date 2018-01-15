require 'rails_helper'

feature 'User authenticates' do
  scenario 'Log in' do
   user = create(:user)
   login_as(user, :scope => :user)
   visit root_path
   

   
   expect(page).to have_css('li', text: 'Sair')
   expect(page).to have_css('li', text: 'Olá, '+user.email)
   
   
   expect(page).not_to have_css('li', text: 'Criar Conta')
   expect(page).not_to have_css('li', text: 'Entrar')
   
   
  end
  
  scenario 'Log out' do
   user = User.create(email: 'teste@teste.com', password: '123456')
   
   visit new_user_session_path
   fill_in 'Email', with: user.email
   fill_in 'Senha', with: user.password
   click_on 'Login'
   click_on 'Sair'
   
   expect(page).not_to have_css('li', text: 'Minhas Receitas')
   expect(page).not_to have_css('li', text: 'Sair')
   expect(page).not_to have_css('li', text: 'Olá, '+user.email)
   
   
   expect(page).to have_css('li', text: 'Criar Conta')
   expect(page).to have_css('li', text: 'Entrar')
   
  end
  
end