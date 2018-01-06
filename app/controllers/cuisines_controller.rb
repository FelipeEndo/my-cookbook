class CuisinesController < ApplicationController
 
  def new
    options_for_select
    @cuisines = Cuisine.new
  end
  
  def show
    options_for_select
    @cuisine = Cuisine.find params[:id]
    @recipes = Recipe.where(cuisine_id: params[:id])
  end
  
  def create
    options_for_select
    name = params[:cuisine][:name]
    @cuisine = Cuisine.create(name: name)
    if @cuisine.save
      redirect_to @cuisine, notice: 'Cozinha cadastrada com sucesso'
    else
      redirect_to new_cuisine_path, notice: 'Você deve informar o nome da cozinha'
    end
  end
end

  private
  
    def options_for_select
      @recipe_all = Recipe.all
      @recipe_type_all = RecipeType.all
      @cuisine_all = Cuisine.all
    end