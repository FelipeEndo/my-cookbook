class UserMailer < ActionMailer::Base
  default from: 'noreply@mycookbook.com'
 
   def recommend_email(email, message, recipe_id)
    @email = email
    @message = message
    @recipe = Recipe.find(recipe_id)
    mail(to: email, subject: 'Compartilharam uma receita com você')
  end

end