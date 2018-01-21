class HomeController < ApplicationController

  def index
    options_for_select
    most_favorited
  end

end

  private
  
    def options_for_select
      @recipe_all = Recipe.all
      @recipe_type_all = RecipeType.all
      @cuisine_all = Cuisine.all
    end
    
    def most_favorited
    @most_favorited = []
    Favorite.group(:recipe_id).count.sort_by{ |recipe_id, numfav| numfav}.reverse.first(3).to_h.each_key{|key| @most_favorited <<  Recipe.find(key)}
    end

