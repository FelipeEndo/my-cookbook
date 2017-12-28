class RecipesController < ApplicationController
  
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end
  
  def new
    @receita = Recipe.new
  end
  
  def create
    title = params[:recipe][:title]
    type = params[:recipe][:recipe_type]
    cuisine = params[:recipe][:cuisine]
    difficulty = params[:recipe][:difficulty]
    cook_time = params[:recipe][:cook_time]
    ingredients = params[:recipe][:ingredients]
    method = params[:recipe][:method]
    r = Recipe.new(title: title, recipe_type: type, cuisine: cuisine, difficulty: difficulty, cook_time: cook_time, 
    ingredients: ingredients, method: method)
    r.save
    @recipe = Recipe.find_by title: title
  end
end