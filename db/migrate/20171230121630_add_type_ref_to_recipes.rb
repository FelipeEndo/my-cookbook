class AddTypeRefToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :recipetype, foreign_key: true
  end
end
