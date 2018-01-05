class RecipesController < ApplicationController
  
  def show
    id = params[:id]
    @recipe = Recipe.find id
    @cuisine = Cuisine.find(@recipe.cuisine_id).name
    options_for_select
  end
  
  def new
    @recipe = Recipe.new
    options_for_select
  end
  
  def create
    options_for_select
    recipe_params = params.require(:recipe).permit(:title, :cuisine_id, :recipe_type_id, :difficulty, :cook_time, :ingredients, :method)
    @recipe  = Recipe.new(recipe_params)
    
    if @recipe.valid?
      @recipe.save
      #@recipe = Recipe.find_by title: params[:recipe][:title]
      @cuisine = Cuisine.find(@recipe.cuisine_id).name
      redirect_to @recipe, notice: 'Receita Cadastrada com sucesso!'
    else
      redirect_to new_recipe_path, notice: 'Você deve informar todos os dados da receita'

    end
  end
  
  def edit
    @recipe = Recipe.find params[:id]
    options_for_select
  end
  
  def update
    options_for_select
    recipe_params = params.require(:recipe).permit(:title, :cuisine_id, :recipe_type_id, :difficulty, :cook_time, :ingredients, :method)
    @recipe = Recipe.find params[:id]
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:notice]='Você deve informar todos os dados da receita'
    end
  end
  
  def search
    options_for_select
    @query = params[:query]
    @results = Recipe.where(title: @query)
  end
end

  private
  
    def options_for_select
    @recipe_all = Recipe.all
    @recipe_type_all = RecipeType.all
    @cuisine_all = Cuisine.all
    end