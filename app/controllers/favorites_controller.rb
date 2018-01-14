class FavoritesController < ApplicationController
  
  def create
    user = params[:user]
    recipe = params[:recipe]
    @favorite = User.find(user).favorites.new(recipe_id: recipe)
    if @favorite.save
      redirect_to recipe_path(recipe), :notice => 'Receita adicionada aos favoritos!'
    end
  end
  
    def destroy
    recipe = params[:recipe]
    @favorite = Favorite.where(user_id: current_user, recipe_id: params[:id]).first
    if @favorite.destroy
      redirect_to recipe_path(recipe), :notice => 'Receita removida dos favoritos!'
    else
      redirect_to recipe_path(recipe), :notice => 'Receita não pode ser removida dos favoritos'
    end
  end
end

