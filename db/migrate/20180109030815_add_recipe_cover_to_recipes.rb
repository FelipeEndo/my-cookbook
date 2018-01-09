class AddRecipeCoverToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :recipe_cover, :string
  end
end
