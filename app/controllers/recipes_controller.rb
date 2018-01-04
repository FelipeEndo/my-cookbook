class RecipesController < ApplicationController
  
  def show
    id = params[:id]
    @recipe = Recipe.find id
    @cuisine = Cuisine.find(id).name
  end
  
  def new
    @recipe = Recipe.new
    options_for_select
    
  end
  
  def create
    recipe_params = params.require(:recipe).permit(:title, :recipe_type, :difficulty, :cook_time, :ingredients, :method, :cuisine)
    r  = Recipe.new(recipe_params)
    if r.save
      @recipe = Recipe.find_by title: title
      @cuisine = Cuisine.find(cuisine).name
    else
      render '_error_messages'
    end
    
  end
  
  def edit
    @recipe = Recipe.find params[:id]
    options_for_select
  end
  
  def update
    title = params[:recipe][:title]
    type = params[:recipe][:recipe_type]
    difficulty = params[:recipe][:difficulty]
    cook_time = params[:recipe][:cook_time]
    ingredients = params[:recipe][:ingredients]
    method = params[:recipe][:method]
    cuisine = params[:recipe][:cuisine]
    r = Recipe.find params[:id]
   if r.update(title: title, recipe_type_id: type, difficulty: difficulty, cook_time: cook_time, 
               ingredients: ingredients, method: method, cuisine_id: cuisine)
      redirect_to r

    else
      render '_error_messages'
    end
  end
  
  def search
    @query = params[:query]
    @results = Recipe.where(title: @query)
  end
end

  private
  
    def options_for_select
     @cuisine_options_for_select = Cuisine.all
     @recipe_type_options_for_select = RecipeType.all.collect {|t| [ t.name, t.id ] }
    end