class RemoveTypeIndexToRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :recipes, :recipetype, foreign_key: true
  end
end
