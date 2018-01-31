class HomeController < ApplicationController
  def index
    options_for_select
    most_favorited
    index_recipes
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
  fav = Favorite.group(:recipe_id)
  fav = fav.count.sort_by { |_recipe_id, numfav| numfav }
  fav = fav.reverse.first(3)
  fav.to_h.each_key { |key| @most_favorited << Recipe.find(key) }
end

def index_recipes
  @index_recipes = Recipe.all.last(6).reverse
end
