class HomeController < ApplicationController

  def index
    options_for_select
  end

end

  private
  
    def options_for_select
      @recipe_all = Recipe.all
      @recipe_type_all = RecipeType.all
      @cuisine_all = Cuisine.all
    end

