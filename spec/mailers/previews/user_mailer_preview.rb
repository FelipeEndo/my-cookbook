class UserMailerPreview < ActionMailer::Preview
  def recommend_email
    UserMailer.recommend_email(User.first.email, "testemsg", Recipe.last.id)
  end
end