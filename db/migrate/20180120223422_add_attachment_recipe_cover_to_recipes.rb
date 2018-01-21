class AddAttachmentRecipeCoverToRecipes < ActiveRecord::Migration[4.2]
  def self.up
    change_table :recipes do |t|
      t.attachment :recipe_cover
    end
  end

  def self.down
    remove_attachment :recipes, :recipe_cover
  end
end
