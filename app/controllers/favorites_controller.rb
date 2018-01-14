class FavoritesController < ApplicationController
  
  def create
    user = params[:user]
    recipe = params[:recipe]
    @favorite = User.find(user).favorites.new(recipe_id: recipe)
    if @favorite.save
      redirect_to root_path
    end
  end
end

private 
