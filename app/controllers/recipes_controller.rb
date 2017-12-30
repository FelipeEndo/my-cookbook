class RecipesController < ApplicationController
  
  def show
    id = params[:id]
    @recipe = Recipe.find id
    @cuisine = Cuisine.find(id).name
  end
  
  def new
    @receita = Recipe.new
    options_for_select
    
  end
  
  def create
    title = params[:recipe][:title]
    type = params[:recipe][:recipe_type]
    difficulty = params[:recipe][:difficulty]
    cook_time = params[:recipe][:cook_time]
    ingredients = params[:recipe][:ingredients]
    method = params[:recipe][:method]
    cuisine = params[:recipe][:cuisine]
    r = Recipe.new(title: title, recipe_type: type, difficulty: difficulty, cook_time: cook_time, 
    ingredients: ingredients, method: method, cuisine_id: cuisine)
    r.save
    @recipe = Recipe.find_by title: title
    @cuisine = Cuisine.find(cuisine).name
  end
end

  private
  
    def options_for_select
     @cuisine_options_for_select = Cuisine.all.collect {|c| [ c.name, c.id ] }
    end