class RemoveUserRefFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :user, :reference
  end
end
