require 'rails_helper'

RSpec.describe '#favorited' do
  it "user favorited" do
    user = create(:user)
    recipe = create(:recipe, user: user)
    Favorite.create(user: user, recipe: recipe)

    fav = user.favorited? recipe

    expect(fav).to be true
  end

  it 'user is not favorite' do
    user = create(:user)
    recipe = create(:recipe, user: user)

    fav = user.favorited? recipe

    expect(fav).to be false
  end
end
