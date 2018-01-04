class RecipeTypesController < ApplicationController
  
  def show
    options_for_select
    @recipe_type = RecipeType.find(params[:id])
    @recipes = Recipe.where(cuisine_id: params[:id])
  end
  
  def new
    options_for_select
    @recipe_type = RecipeType.new
  end
  
  def create
    options_for_select
    name = params[:recipe_type][:name]
    @recipe_type = RecipeType.create(name: name)
    if @recipe_type.save
      redirect_to @recipe_type
    else
      render '_error_messages'
    end
  end
end

private
  
    def options_for_select
      @recipe_all = Recipe.all
      @recipe_type_all = RecipeType.all
      @cuisine_all = Cuisine.all
    end