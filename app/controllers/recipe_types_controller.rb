class RecipeTypesController < ApplicationController
  
  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = Recipe.where(cuisine_id: params[:id])
  end
  
  def new
    @recipe_type = RecipeType.new
  end
  
  def create
    name = params[:recipe_type][:name]
    @recipe_type = RecipeType.create(name: name)
    if @recipe_type.save
      redirect_to @recipe_type
    else
      render '_error_messages'
    end
  end
end