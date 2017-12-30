class HomeController < ApplicationController

  def index
    @recipes = Recipe.all
    @cuisine = "banana"
  end

end

private

