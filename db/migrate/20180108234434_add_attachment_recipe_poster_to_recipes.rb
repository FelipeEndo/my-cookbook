class AddAttachmentRecipePosterToRecipes < ActiveRecord::Migration[4.2]
  def self.up
    change_table :recipes do |t|
      t.attachment :recipe_poster
    end
  end

  def self.down
    remove_attachment :recipes, :recipe_poster
  end
end
