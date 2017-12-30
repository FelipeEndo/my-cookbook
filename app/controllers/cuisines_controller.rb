class CuisinesController < ApplicationController
 
  def new
    @cuisines = Cuisine.new
  end
  
  def show
    @cuisine = Cuisine.find params[:id]
    @recipes = Recipe.where(cuisine_id: params[:id])
  end
  
  def create
    name = params[:cuisine][:name]
    @cuisine = Cuisine.create(name: name)
    if @cuisine.save
      redirect_to @cuisine
    else
      render '_error_message'
    end
  end

  
end